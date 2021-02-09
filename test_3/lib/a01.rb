class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    return self if self.length <= 1
    prc ||= proc {|a,b| a <=> b}
    
    mid = self.length/2
    left = self[0...mid] 
    right =  self[mid..-1]
    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)

    Array.merge(left_sorted, right_sorted, &prc)
  
  end

  private
  def self.merge(left, right, &prc)
    result = []

    until left.empty? || right.empty?
      if prc.call(left, right) == -1
        result << left.shift
      else
        result << right.shift
      end
    end
    result += left + right
  end

end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    result = []
    (0...self.length-1).each do |i|
      (i+1...self.length).each do |j| 
        if self[i] + self[j] == target 
         result << [i, j]               
        end
      end
    end
    result
  end

end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    return self if level == 0
    return total_flatten(self) if level.nil?
    arr = self.dup
    result = []
      
    arr.each do |ele|
      if ele.is_a? Array
        result += ele.my_flatten(level-1)
      else
        result << ele
      end
    end
  
    result
  end

  def total_flatten(arr)   
    return arr if !arr.is_a? Array
    result = []
    arr.each do |ele|
      if ele.is_a? Array
        result += total_flatten(ele)
      else
        result << ele
      end
    end
    result
  end


end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    arr = self.split('')
    result = []
    (0...arr.length-1).each do |i|
      (i+1...arr.length).each do |j|
        if arr[i..j] == arr[i..j].reverse
          result << arr[i..j].join('')
        end
      end
    end
    result
  end


end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
  return nil if n == 0 
  count = 0
  i = 0
  while count < n
    if is_prime?(i)
      count += 1 
    end
    i +=1
  end
  i - 1
end

def is_prime?(num)
  return false if num < 2
  (2...num).all?{|i| num % i != 0}
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    arr = self
    i = 0 
    while i < arr.length
    prc.call(arr[i])
    i+=1
    end
    arr
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    arr = self
    result = []
   arr.each{|ele| result << ele if prc.call(ele)}
   result
  end


end

