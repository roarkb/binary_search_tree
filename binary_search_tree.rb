#!/usr/bin/env ruby

require "./node"

class BinarySearchTree # ints only
  def initialize(value)
    validate(value) do
      @tree = Node.new(value)
      @value = @tree.value
    end
  end

  attr_reader :value

  def left
    @tree.left
  end
  
  def right
    @tree.right
  end

  def insert(values) # single int or array of ints
    if values.kind_of? Integer
      insert_one(values)
    elsif values.kind_of? Array
      values.each { |e| insert_one(e) }
    else
      puts "not a valid format"
    end
  end

  def lookup(value, node=@tree)
    validate(value) do
      case node.value <=> value
      when -1
        if node.right == nil
          false
        else
          lookup(value, node.right)
        end
      when 1
        if node.left == nil
          false
        else
          lookup(value, node.left)
        end
      when 0
        true
      end
    end
  end

  def values # breadth-first
    values = [ @tree.value ]
    queue = [ @tree ]

    until queue.empty?
      queue = queue.inject([]) do |a,node|
        
        [ node.left, node.right ].each do |e|
          
          if e != nil
            values << e.value
            queue << e
          end
        end

        a
      end
    end

    values
  end

  def paths # depth-first 
    curr_node = @tree
    curr_path = []
    track = {}
    paths = []
    last_move = nil
    finished = false
    
    curr_path << @tree.value
    #debug_paths(curr_node, curr_path, track, paths, last_move, finished)
   
    until finished == true
      #debug_paths(curr_node, curr_path, track, paths, last_move, finished)
      
      # am i allowed to go left?
      if track.include?(curr_node.value) && track[curr_node.value].include?("left")
        # i am not allowed to go left but am i allowed/able to go right?
        if track[curr_node.value].include?("right") || curr_node.right == nil
          # i am not allowed to go left and i am not allowed/able to go right, incomplete path and dead end
          if curr_path == [ @tree.value ]
            finished = true
          else
            if curr_path.length > 1
              e = curr_path[-2]
              track[e] = [] unless track.include?(e)
              track[e] << last_move unless track[e].include?(last_move)
            end

            curr_path = [ @tree.value ]
            curr_node = @tree
          end
        
        # im going right
        else
          curr_node = curr_node.right
          curr_path << curr_node.value
          last_move = "right"
        end
        
      # i am alowed to go left but am i able?
      elsif curr_node.left == nil
        # i am not able to go left but am i allowed to go right?
        if track.include?(curr_node.value) && track[curr_node.value].include?("right")
          # i am not able to go left and i am not allowed to go right, incomplete path and dead end
          if curr_path == [ @tree.value ]
            finished = true
          else
            if curr_path.length > 1
              e = curr_path[-2]
              track[e] = [] unless track.include?(e)
              track[e] << last_move unless track[e].include?(last_move)
            end

            curr_path = [ @tree.value ]
            curr_node = @tree
          end

        # i am allowed to go right but am i able?
        elsif curr_node.right == nil
          # i am a leaf node, this path is complete
          if curr_path.length > 1
            e = curr_path[-2]
            track[e] = [] unless track.include?(e)
            track[e] << last_move unless track[e].include?(last_move)
          end

          paths << curr_path
          curr_path = [ @tree.value ]
          curr_node = @tree
        
        # im going right
        else
          curr_node = curr_node.right
          curr_path << curr_node.value
          last_move = "right"
        end
      
      # im going left
      else
        curr_node = curr_node.left
        curr_path << curr_node.value
        last_move = "left"
      end
    end

    #debug_paths(curr_node, curr_path, track, paths, last_move, finished)
    paths
  end
  
  private
  
  def validate(value)
    if value.kind_of? Integer
      yield
    else
      puts '"' + value + '"' + " is not an intiger"
    end
  end

  def insert_one(value, node=@tree)
    validate(value) do
      case node.value <=> value
      when -1
        if node.right == nil
          node.right = Node.new(value)
        else
          insert_one(value, node.right)
        end
      when 1
        if node.left == nil
          node.left = Node.new(value)
        else
          insert_one(value, node.left)
        end
      when 0
        puts "#{value} already exists"
      end
    end
  end
  
  def debug_paths(curr_node, curr_path, track, paths, last_move, finished)
    puts
    puts "curr_node: #{curr_node.value}"
    puts "curr_path: #{curr_path}"
    puts "track: #{track}"
    puts "paths: #{paths}"
    puts "last_move: #{last_move}"
    puts "finished: #{finished}"
    puts
  end
end
