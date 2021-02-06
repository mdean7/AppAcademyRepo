class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    # if !accumulator.nil?
    self.map do |ele|
     prc.call(ele)
    # end
    end
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2 
  (2...num).all? {|n| num % n != 0}
end

def primes(num)
  count = 0
  i = 0
  result = []
  while count < num
    if is_prime?(i)
      result << i
      count +=1
    end
    i+=1
  end
result
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [0] if num == 0
  return [1] if num == 1
  return [1,1] if num == 2
  factorials_rec(num-1)

end

p factorials_rec(0)


class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    sorted = Hash.new(){|h, k| h[k] = []}
     self.each.with_index{|ele, i| sorted[ele] << i }
     result = Hash.new(){|h, k| h[k] = []}
     sorted.each{|k, v| result[k] = v if v.length > 1 }
     result
  end


end
p [1,1,2,3,4,3].dups
p [1,1,2,3,4,4].dups

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    arr = self.split('')
    result = []
    arr.each_with_index do |char1, i|
      arr[i+1..-1].each_with_index do |char2, j|
       result << self[i..j] if self[i..j] == self[i..j].reverse
      end
    end
    result
  end


end
p 'hell'.symmetric_substrings


class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    
    return [] if self.empty? 
    return self if self.length == 1
        mid = self.length/2
        left = self[0...mid]
        right = self[mid+1..-1]
    Array.merge(left.merge_sort, right.merge_sort, &prc)
  end

  private
    def self.merge(left, right, &prc)
      result = []

          until left.empty? || right.empty?        
            if !prc.nil?
              if prc.call(left[0], right[0])
                result << left.shift
              else
                result << right.shift
              end
            else 
              if left[0] < right[0]
                result << left.shift
              else
                result << right.shift
              end
            end

            end
      result + left + right
      end

  end
