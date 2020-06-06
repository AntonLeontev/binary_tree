class Node

  attr_accessor :value, :left, :right, :tree_size

  def initialize
    @tree_size = 0
  end

  def add_node(num)
    @tree_size += 1
    if @value.nil?
      @value = num
      @left  = Node.new
      @right = Node.new
    elsif num <= @value
      @left.add_node(num)
    else
      @right.add_node(num)
    end
  end

  def show_in_order
    return [] if @value.nil?
    result = Array.new(@tree_size)
    in_order_traversal(self, result, 0)
    result
  end

  def clear
    @left.clear if @left.value
    @right.clear if @right.value
    @value     = nil
    @right     = nil
    @left      = nil
    @tree_size = 0
  end

  def copy
    clone = Node.new
    root_to_leaves(self, clone) if !@value.nil?
    clone
  end

  def contains?(num)
    !!search_node(num)
  end  

  def remove_node(num)
    
  end

  protected

  def search_node(num)
    return false if @value.nil?
    case num <=> @value
    when -1
      @left.search_node(num)
    when 0
      self
    when 1
      @right.search_node(num)
    end
  end

  private

  def in_order_traversal(node, result, i)
    i = in_order_traversal(node.left, result, i) if node.left.value
    result[i] = node.value
    i += 1
    i = in_order_traversal(node.right, result, i) if node.right.value
    i
  end

  def root_to_leaves(node, clone)
    clone.add_node(node.value)
    root_to_leaves(node.left, clone) if node.left.value
    root_to_leaves(node.right, clone) if node.right.value
  end



end
