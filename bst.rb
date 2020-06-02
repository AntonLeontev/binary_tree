class BinaryTree

  attr_reader :node_amount

  def initialize
    @tree        = Node.new
    @node_amount = 0
  end

  def store_number(num)
    add_node(@tree, num)
    @node_amount += 1    
  end

  private

  def add_node(node, num)
    if node.value.nil?
      node.value = num
      node.counter += 1
    else
      case num <=> node.value
      when -1
        node.left.nil? ? node.left = Node.new(num) : add_node(node.left, num) 
      when 0
        node.counter += 1
      when 1
        node.right.nil? ? node.right = Node.new(num) : add_node(node.right, num)       
      end
    end
  end


  class Node

    attr_accessor :value, :left, :right, :counter

    def initialize(num = nil)
      @value   = num
      @counter = num.nil? ? 0 : 1
      @left    = nil
      @right   = nil
    end



  end
end


