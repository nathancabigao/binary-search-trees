# frozen-string-literal: true

# Class for creating node instances to be used in Binary Search Trees.
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end
