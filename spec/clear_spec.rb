require "rspec"
require_relative "../bst.rb"

describe 'clear' do
  it 'should return empty array' do
    bst = BinaryTree.new
    200.times {bst.store_number (rand(-200..200))}
    bst.clear
    expect(bst.show_in_order).to eq([])
  end
end
