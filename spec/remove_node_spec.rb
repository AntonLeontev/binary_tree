require "rspec"
require_relative '../binary_tree_simple.rb'

describe 'remove_node' do
  before(:each) do
    @bst = Node.new
  end 

  it 'should pass simple tests' do
    expect(@bst.remove_node(32)).to eq(false)
  end

  it 'should remove node' do
    @bst.store_number(32)
    expect(@bst.remove_node(32)).to be true
    expect(@bst.show_in_order).to eq []
  end

  it 'should pass simple tests' do
    @bst.store_array([12,32,15,78,64])
    @bst.remove_node(78)
    expect(@bst.show_in_order).to eq [12,15,32,64]
  end

  it 'should pass simple tests' do
    @bst.store_array([12,32,15,78,64])
    @bst.remove_node(78)
    @bst.remove_node(32)
    @bst.remove_node(56)
    expect(@bst.show_in_order).to eq [12,15,64]
  end

  it 'should pass random tests' do
    arr = Array.new(10_000) { rand(-1_000_000..1_000_000) }
    @bst.store_array(arr)
    1000.times do
      removed_item = arr.delete_at(arr.index(arr.sample))
      @bst.remove_node(removed_item)
    end
    expect(@bst.show_in_order).to eq arr.sort
  end

  it 'should pass random tests' do
    arr = Array.new(10_000) { rand(-100..100) }
    @bst.store_array(arr)
    1000.times do
      removed_item = arr.delete_at(arr.index(arr.sample))
      @bst.remove_node(removed_item)
    end
    expect(@bst.show_in_order).to eq arr.sort
  end
 
end
