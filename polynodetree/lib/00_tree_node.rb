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
  
  def inspect
    "#<Stack:#{self.value}>"
  end

end