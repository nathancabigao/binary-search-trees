# frozen-string-literal: true

require_relative 'lib/node'
require_relative 'lib/tree'

# This is a driver script to test the binary search tree implementation.
# See "Tie it all together" in the link below:
# https://www.theodinproject.com/lessons/ruby-binary-search-trees

# Step 1. Create a binary search tree from an array of random numbers
puts 'Creating an array of random numbers 1-100:'
test_array = Array.new(15) { rand(1..100) }
p test_array
test_bst = Tree.new(test_array)
test_bst.pretty_print

# Step 2. Confirm that the tree is balanced by calling #balanced?
puts "BST balanced? #{test_bst.balanced?}"

# Step 3. Print out all elements in level, pre, post, and in order
puts "\nPreorder: #{test_bst.preorder.inspect}"
puts "Inorder: #{test_bst.inorder.inspect}"
puts "Postorder: #{test_bst.postorder.inspect}"

# Step 4. Unbalance the tree by adding several numbers > 100
puts "\nUnbalancing the tree, adding 5 numbers over 100..."
5.times { test_bst.insert(rand(101..200))}
test_bst.pretty_print

# Step 5. Confirm that the tree is unbalanced by calling #balanced?
puts "BST balanced? #{test_bst.balanced?}"

# Step 6. Balance the tree by calling #rebalance
puts "\nRebalancing tree..."
test_bst.rebalance
test_bst.pretty_print

# Step 7. Confirm that the tree is balanced by calling #balanced?
puts "BST balanced? #{test_bst.balanced?}"

# Step 8. Print out all elements in level, pre, post, and in order
puts "\nPreorder: #{test_bst.preorder.inspect}"
puts "Inorder: #{test_bst.inorder.inspect}"
puts "Postorder: #{test_bst.postorder.inspect}"

puts "\nTesting complete."
