#!/usr/bin/env ruby

require "./binary_search_tree"

def test(title, values, lookup_terms)
  bad_data = values.first.class == String ? 1 : "foo"
  
  puts "\n#{title.upcase}:\n\n"
  p t = BinarySearchTree.new(values.shift)
  puts
  t.insert(values.shift)
  p t
  puts
  t.insert(*values)
  p t
  puts
  t.insert(bad_data)
  puts
  p t.lookup(values.first)
  p t.lookup()
  puts
  p t.lookup(*lookup_terms)
  puts
  puts "breadth-first list:"
  p t.list_breadth_first
  puts
  puts "depth-first preorder list:"
  p t.list_preorder
  puts
  puts "depth-first inorder list:"
  p t.list_inorder
  puts
  puts "depth-first postorder list:"
  p t.list_postorder
  puts
  puts "all paths root to leaf:"
  p t.paths
  puts
end

test(
  "ints", 
  [ 10, 5, 1, 8, 12, 20, 7, 14 ],
  (0..25).to_a
)

test(
  "strings", 
  [ "foo", "bar", "gaz", "fub", "zuz", "guf", "kik", "pup" ], 
  [ "foo", "bar", "mmm", "gaz", "fub", "yyy", "zuz", "guf", "kik", "hhh", "pup" ]
) 

test(
  "arrays",
  [ [ 5, 6, 7 ], [ 8, 9, 10 ], [ 2, 3, 4 ], [ 6, 7, 8 ], [ 3, 4, 5 ], [ 7, 8, 9 ] ],
  [ [ 5, 6, 7 ], [ 8, 9, 10 ], [ 2, 3, 4 ], [ 6, 7, 8 ], [ 3, 4, 5 ], [ 7, 8, 9 ], [ 9, 9, 9 ], [ 8, 8, 8 ], [ 7, 7, 7] ]
)
