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
end
