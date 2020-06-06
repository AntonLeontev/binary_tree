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

  def store_array(arr)
    arr.each { |v| self.store_number(v) }
  end

  def show_in_order
    result = Array.new(@numbers_stored)
    in_order_traversal(@tree, result, 0)
    result
  end

  def clear
    remove_descendants(@tree)
    @tree           = Node.new
    @numbers_stored = 0
    @sum            = 0
    @min_number     = nil
    @max_number     = nil
  end

  def copy
    clone = BinaryTree.new
    root_to_leaves(@tree, clone)
    clone
  end

  def contains?(num)
    search_node(@tree, num)
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

  def in_order_traversal(node, result, i)
    i = in_order_traversal(node.left, result, i) if node.left 
    node.counter.times { result[i] = node.value; i += 1 }
    i = in_order_traversal(node.right, result, i) if node.right
    i
  end

  def remove_descendants(node)
    remove_descendants(node.left) if node.left
    remove_descendants(node.right) if node.right
    node.left = nil
    node.right = nil
  end

  def root_to_leaves(node, clone)
    node.counter.times { clone.store_number(node.value) }
    root_to_leaves(node.left, clone) if node.left
    root_to_leaves(node.right, clone) if node.right
  end

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

  def search_node(node, num)
    case num <=> node.value 
    when -1
      return search_node(node.left, num) if node.left
    when 0
      return true
    when 1
      return search_node(node.right, num) if node.right
    end
    false
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

