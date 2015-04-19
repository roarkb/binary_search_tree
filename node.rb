#!/usr/bin/env ruby

class Node
  def initialize(value)
    @value = value
    @right = nil
    @left = nil
  end

  attr_reader :value
  attr_accessor :right, :left
end
