# frozen-string-literal: true

# Class for creating binary search trees made of nodes.
class Tree
  def initialize(array = nil)
    @array = array.sort.uniq
    @root = build_tree(@array)
  end
end
