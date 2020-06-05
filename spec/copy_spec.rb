require "rspec"
require_relative "../bst.rb"

describe 'copy' do
  before(:all) do 
    @bst = BinaryTree.new
    200.times {@bst.store_number (rand(-200..200))}
  end

  it 'should return a precisely same array' do
    bst = BinaryTree.new
    200.times {@bst.store_number (rand(-200..200))}
    bst2 = bst.copy
    expect(bst2.show_in_order).to eq(bst.show_in_order)
  end
end
