require "rspec"
require_relative "../bst.rb"

describe 'show_in_order' do
  before(:all) do 
    @bst = BinaryTree.new
    200.times {@bst.store_number (rand(-200..200))}
    @arr = @bst.show_in_order
  end

  it 'should return an array' do
    expect(@arr).to be_an(Array)
  end

  it 'should be only integers in array' do
    @arr.each do |i|
      expect(i).to be_an(Integer)
    end
  end

  it 'each element should be less or equal to the next' do
    (0..(@arr.size - 2)).each do |i|
      expect(@arr[i]).to be <= @arr[i + 1]
    end
  end
end
