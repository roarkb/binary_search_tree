#!/usr/bin/env ruby

require "./binary_search_tree"

# ints
puts "\nINTS:\n\n"
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
puts "breadth-first list:"
p t.list_breadth_first
puts
puts "preorder list:"
p t.list_preorder
puts
puts "inorder list:"
p t.list_inorder
puts
puts "postorder list:"
p t.list_postorder
puts
puts "all paths root to leaf:"
p t.paths
puts
p t.right.left.right.value

# strings
puts "\nSTRINGS:\n\n"
p t = BinarySearchTree.new("foo")
puts
t.insert("bar")
p t
puts
t.insert([ "gaz", "fub", "mif", "sup" ])
p t
puts
t.insert(5)
puts
[ "qwe", "foo", "asd", "gaz", "zxc", "fub", "wer", "mif", "sup" ].each { |e| puts "#{e}: #{t.lookup(e)}" }
puts
puts "breadth-first list:"
p t.list_breadth_first
puts
puts "preorder list:"
p t.list_preorder
puts
puts "inorder list:"
p t.list_inorder
puts
puts "postorder list:"
p t.list_postorder
puts
puts "all paths root to leaf:"
p t.paths
puts
p t.right.left.value

# other
puts "\nOTHER:\n\n"
t = BinarySearchTree.new([])
t = BinarySearchTree.new({})
puts
