class GraphNode

  attr_reader :val, :neighbors

  def initialize(val)
    @val = val
    @neighbors = []
  end

  def add_neighbor(node)
    @neighbors << node
  end
end

def bfs(1stnode, target)
  line = [1stnode]
  checked = Set.new()

  while !line.empty?
    node = line.shift
    if !checked.include?(node)
      return node.val if node.val == target
      checked.add(node)
      line += node.neighbors
    end
  end  
  return nil
end
# a = GraphNode.new('a')
# b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]