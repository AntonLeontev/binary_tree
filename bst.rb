class BinaryTree
  attr_reader :numbers_stored, :sum, :min_number, :max_number

  def initialize
    @tree           = Node.new
    @numbers_stored = 0
    @sum            = 0
    @min_number     = nil
    @max_number     = nil
  end

  def store_number(num)
    add_node(@tree, num)
    @numbers_stored += 1    
    @sum            += num
    @min_number = min_number.nil? ? num : [min_number, num].min
    @max_number = max_number.nil? ? num : [max_number, num].max
  end

  def show_in_order
    result = Array.new(@numbers_stored)
    in_order_traversal(@tree, result, 0)
    result
  end

  def in_order_traversal(node, result, i)
    i = in_order_traversal(node.left, result, i) if node.left 
    node.counter.times { result[i] = node.value; i += 1 }
    i = in_order_traversal(node.right, result, i) if node.right
    i
  end

  def show_in_reverse_order(node = @tree, 
                            result = Array.new(@numbers_stored), 
                            i = 0)
    arr = node.right ? show_in_reverse_order(node.right, result, i) : [result, i] 
    node.counter.times do 
      arr[0][arr[1]] = node.value 
      arr[1] += 1 
    end
    arr = show_in_reverse_order(node.left, arr[0], arr[1]) if node.left
    arr[1] == @numbers_stored ? arr[0] : arr
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

