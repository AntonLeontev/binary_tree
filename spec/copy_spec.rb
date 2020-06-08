require "rspec"
require_relative '../binary_tree_uniq.rb'

describe 'copy' do
  before(:all) do 
    @bst = BinaryTreeUniq.new
    200.times {@bst.store_number (rand(-200..200))}
  end

  it 'should return a precisely same array' do
    bst = BinaryTreeUniq.new
    200.times {@bst.store_number (rand(-200..200))}
    bst2 = bst.copy
    expect(bst2.show_in_order).to eq(bst.show_in_order)
  end
end
