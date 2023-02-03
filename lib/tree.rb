# frozen-string-literal: true

require_relative 'node'

# Class for creating binary search trees made of nodes.
class Tree
  def initialize(array = nil)
    @array = array.sort.uniq
    @root = build_tree(@array)
  end

  def build_tree(array)
    return nil if array.empty?

    mid = array.size / 2
    root = Node.new(array[mid])
    root.left = build_tree(array.slice(0...mid))
    root.right = build_tree(array.slice(mid + 1..array.size - 1))
    root
  end

  # Source: https://www.theodinproject.com/lessons/ruby-binary-search-trees
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value, node = @root)
    # insert as first if root nil
    return Node.new(value) if node.nil?

    # insert right if new value > root data
    if value > node.data
      node.right = insert(value, node.right)
    # insert left if value < root data
    elsif value < node.data
      node.left = insert(value, node.left)
    end
    # return the node after insert
    node
  end

  def delete(value, node = @root)
    # return node if node nil
    return node if node.nil?

    # if value < node.data, go left
    if value < node.data
      node.left = delete(value, node.left)
    # if value > node.data, go right
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      # if node is a leaf node, return nil
      return nil unless node.any_children?
      # return the left or right child if any
      return delete_check_children(node) if node.only_one_child?

      # else, delete the value and move its successor to the deleted node spot
      delete_move_successor(node)
    end
    node
  end

  def delete_check_children(node)
    # if it has only a left, return left
    return node.right if node.left.nil?

    # else if it has only a right, return right
    return node.left if node.right.nil?
  end

  def delete_move_successor(node)
    # else set the value of node as of its inorder successor and...
    node.data = min_value_node(node.right).data

    # recur to delete the node with value of the inorder successor
    node.right = delete(node.data, node.right)
  end

  # Returns the lowest value in the given tree
  def min_value_node(node = @root)
    node = node.left while node && !node.left.nil?
    node
  end

  def find(value, node = @root)
    # Base case: node is nil or node matches
    return node if node.nil? || node.data == value
    # Base case pt. 2: return nil if no match and no children
    return nil unless node.any_children?

    # Find in either the left or right
    find_left_right(value, node)
  end

  def find_left_right(value, node)
    return find(value, node.left) if node.left && value < node.data
    return find(value, node.right) if node.right && value > node.data
  end

  def inorder(node = @root, out = [], &block)
    return nil if node.nil?

    inorder(node.left, out)
    out << (block_given? ? block.call(node) : node.data)
    inorder(node.right, out)
    out
  end

  def preorder(node = @root, out = [], &block)
    return nil if node.nil?

    out << (block_given? ? block.call(node) : node.data)
    preorder(node.left, out)
    preorder(node.right, out)
    out
  end

  def postorder(node = @root, out = [], &block)
    return nil if node.nil?

    postorder(node.left, out)
    postorder(node.right, out)
    out << (block_given? ? block.call(node) : node.data)
    out
  end
end
