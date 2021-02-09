gem 'rspec'
require 'practice_test_copy'


describe 'Array#my_bsearch' do
  # create a method that performs a binary search in an array for
  # an element and returns its index
  let(:arr) { [11, 22, 33, 44, 66] }

  disallowed_methods = [
    :index, :find_index, :include?, :member?, :dup
  ]

  before(:each) do
    disallowed_methods.each do |method|
      expect(arr).not_to receive(method)
    end
    expect_any_instance_of(Array).not_to receive(:index)
  end

  it "returns nil if the array is empty" do
    expect([].my_bsearch(11)).to be_nil
  end

  it "returns the index of a target" do
    expect(arr.my_bsearch(33)).to eq(2)
  end

  it "returns the index of a target that's less than the midpoint" do
    expect(arr.my_bsearch(22)).to eq(1)
  end

  it "returns the index of a target that's greater than the midpoint" do
    expect(arr.my_bsearch(66)).to eq(4)
  end

  it "returns nil if the target isn't found" do
    # Properly returns nil searching left half
    expect(arr.my_bsearch(5)).to be_nil
    # Properly returns nil searching right half
    expect(arr.my_bsearch(80)).to be_nil
  end
end


describe '#fibs_sum' do
  it 'returns the sum of the first fibonacci number' do
    expect(fibs_sum(1)).to eq(1)
  end

  it 'returns the sum of the first 2 fibonacci numbers' do
    expect(fibs_sum(2)).to eq(2)
  end

  it 'returns the sum of the first 6 fibonacci numbers' do
    expect(fibs_sum(6)).to eq(20)
  end

  it "calls itself recursively" do 
    expect(self).to receive(:fibs_sum).at_least(:twice).and_call_original
    fibs_sum(6)
  end
end

describe "#string_include_key" do
  it "returns true for the same string" do
    expect(string_include_key?("adblfci", "abc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 1" do
    expect(string_include_key?("adbblfci", "abbc")).to eq(true)
  end

  it "handles keys with duplicate characters: case 2" do
    expect(string_include_key?("adbclfci", "abbc")).to eq(false)
  end

  it "returns false if the key characters are in the wrong order" do
    expect(string_include_key?("dblfcia", "abc")).to eq(false)
  end

  it "returns false if the string doesn't contain the key" do
    expect(string_include_key?("db", "abc")).to eq(false)
  end
end

describe "#digital_root" do
  before(:each) do
    expect_any_instance_of(Integer).to_not receive(:to_s)
    expect_any_instance_of(Integer).to_not receive(:digits)
  end
  
  it "calculates the digital root of a single-digit number" do
    expect(digital_root(9)).to eq(9)
  end

  it "calculates the digital root of a multi-digit number" do
    expect(digital_root(125)).to eq(8)
  end
  
  it "calculates the digital root of a larger number" do
    expect(digital_root(4322)).to eq(2)
  end
end

# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.
describe '#first_even_numbers_sum' do
  it "returns the sum of the first even number" do
    expect(first_even_numbers_sum(1)).to eq(2)
  end

  it "returns the sum of the first n even numbers" do
    expect(first_even_numbers_sum(6)).to eq(42)
  end

  it "calls itself recursively" do
    expect(self).to receive(:first_even_numbers_sum).at_least(:twice).and_call_original
    first_even_numbers_sum(6)
  end
end

describe "#exponent" do
  it "returns the correct answer for positive exponents" do
    expect(exponent(5,3)).to eq(125)
  end

  it "returns the correct answer for negative exponents" do
    expect(exponent(2, -3)).to eq(1/8.0)
  end

  it "returns the correct answer when n is 0" do
    expect(exponent(2, 0)).to eq(1)
  end

  it "calls itself recursively" do
    expect(self).to receive(:exponent).at_least(:twice).and_call_original
    exponent(2, 3)
  end
end

describe "Array#my_zip" do
  let(:arr1) { [ 4, 5, 6 ] }
  let(:arr2) { [ 7, 8, 9 ] }

  before(:each) do
    expect_any_instance_of(Array).not_to receive(:zip)
  end 

  it "Zips arrays of the same size" do
    expect([1, 2, 3].my_zip(arr1, arr2)).to eq([[1, 4, 7], [2, 5, 8], [3, 6, 9]])
  end

  it "Zips arrays of differnet sizes and adds nil appropriately" do
    expect(arr1.my_zip([1,2], [8])).to eq([[4, 1, 8], [5, 2, nil], [6, nil, nil]])
  end

  let(:arr3) { [10, 11, 12] }
  let(:arr4) { [13, 14, 15] }

  it "Zips arrays with more elements than the original" do
    expect([1, 2].my_zip(arr1, arr2, arr3, arr4)).to eq([[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]])
    expect([].my_zip(arr1, arr2, arr3, arr4)).to eq([])
  end
end


describe "Array#my_flatten" do
  let(:arr) { [1, 2, 3, [4, [5, 6]], [[[7]], 8]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it 'flattens arrays correctly' do
    expect(arr.my_flatten).to eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it 'works on one dimensional arrays' do
    expect([1,2,3,4,5].my_flatten).to eq([1,2,3,4,5])
  end
end

describe "Array#my_controlled_flatten" do
  let(:arr) { [1,[2,3], [4,[5]], [[6,[7]]]] }
  
  before(:each) do
    expect(arr).not_to receive(:flatten)
    expect(arr).not_to receive(:flatten!)
  end

  it "flattens an array the specified number of levels" do
    expect(arr.my_controlled_flatten(1)).to eq([1,2,3,4,[5], [6, [7]]])
  end

  it "returns a one dimensional array when invoked without an argument" do
    expect(arr.my_controlled_flatten).to eq([1, 2, 3, 4, 5, 6, 7])
  end

  it "works on one dimensional arrays" do
    expect([1,2,3,4,5].my_controlled_flatten).to eq([1,2,3,4,5])
  end
end

