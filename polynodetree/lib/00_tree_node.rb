class PolyTreeNode
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) if @parent
    @parent = node
    node.children << self if node && !node.children.include?(self) 
  end
  
  def add_child(node)
    self.children << node if !children.include?(node)
    node.parent = self
  end

  def remove_child(node)
    raise 'node is not a child' if !self.children.include?(node)
    node.parent = nil
  end

  def dfs(target_value)
    node = self
    return node if node.value == target_value
    node.children.each do |ele|
      possible_node = ele.dfs(target_value)
      return possible_node if possible_node
    end
    nil
  end

  def inspect
    "#<Stack:#{self.value}>"
  end

end

