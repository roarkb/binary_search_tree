#!/usr/bin/env ruby

require "./binary_search_tree"

puts
p t = BinarySearchTree.new(10)
puts
t.insert(5)
p t
puts
t.insert([ 15, 1, 8, 12, 20, 7, 14 ])
p t
puts
t.insert("foo")
puts
(1..25).to_a.each { |e| puts "#{e}: #{t.lookup(e)}" }
puts
p t.values
puts
p t.paths
puts
p t.right.left.right.value
puts
t = BinarySearchTree.new("foo")
puts
