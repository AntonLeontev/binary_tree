require "rspec"
require_relative '../binary_tree_uniq.rb'

describe 'clear' do
  it 'should return empty array' do
    bst = BinaryTreeUniq.new
    200.times {bst.store_number (rand(-200..200))}
    bst.clear
    expect(bst.show_in_order).to eq([])
  end
end
