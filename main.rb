# frozen-string-literal: true

require_relative 'lib/node'
require_relative 'lib/tree'

# Test node
puts 'Testing, making a node with data value 9:'
test_node = Node.new(9)
p test_node

# Test making a tree
test_array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
puts "\nMaking a tree with array #{test_array.inspect}..."
test_tree = Tree.new(test_array)
test_tree.pretty_print

# Test inserting a node
test_insert = 69
puts "\nTesting inserting a node with value #{test_insert}:"
test_tree.insert(test_insert)
test_tree.pretty_print

# Test deleting a node
test_delete = 67
puts "\nTesting deleting a node with value #{test_delete}:"
test_tree.delete(test_delete)
test_tree.pretty_print

# Test finding a node
test_find = 3
puts "\nTesting finding a node with value #{test_find}:"
p test_tree.find(test_find)
test_find = 0
puts "\nTesting finding a non-existent node with value #{test_find}:"
p test_tree.find(test_find)

# Testing depth-level traversal
puts "\nTesting Depth-Level traversal methods."
puts "Preorder array: #{test_tree.preorder.inspect}"
puts "Inorder array: #{test_tree.inorder.inspect}"
puts "Postorder array: #{test_tree.postorder.inspect}"
puts 'Test inorder with a block to multiply node data by 2:'
x = test_tree.inorder { |node| node.data * 2 }
p x
