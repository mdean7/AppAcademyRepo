require 'byebug'
class Array
  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  # **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
  # or `Array#member` methods in your implementation.**
  
  # NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
  # We will not give you points if you visit every element in the array every 
  # time you search.

  # For example, given the array [1, 2, 3, 4], you should NOT be checking
  # 1 first, then 2, then 3, then 4.
      def my_bsearch(target)
        return nil if self.empty?
       mp = self.count/2
       left = self[0...mp]
       right = self[mp+1..-1]

        if self[mp] == target 
          return mp
        elsif target < self[mp]
          left.my_bsearch(target)
        else
          memo = right.my_bsearch(target)
         memo.nil? ? nil : memo + mp + 1
        end
      end
  
end


# Write a method that finds the sum of the first n fibonacci numbers recursively. 
# Assume n > 0.\
# fib 1 1 2 3 5
# nth 1 2 3 4 5
# ans 1 2 4 7 12
def fibs_sum(n)
  return 1 if n == 1
  return 2 if n == 2
  fibs_sum(n-1) + fibs_sum(n-2) + 1
end

# Write a recursive method `string_include_key?(string, key)` that takes in a 
# string to search and a key string.  Return true if the string contains all of 
# the characters in the key in the same order that they appear in the key.

# example_1: string_include_key?("cadbpc", "abc") => true
# example_2: string_include_key("cba", "abc") => false

def string_include_key?(str, key)  
  # debugger
  return false if str.length < key.length
  return true if key.empty?
  
  if str[0] == key[0] 
    string_include_key?(str[1..-1], key[1..-1]) 
  else 
    string_include_key?(str[1..-1], key)
  end

end


# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 9 (i.e. more than one digit), sum the digits of
# the resulting number. Keep repeating until there is only one digit in the 
# result, called the "digital root". **Do NOT use the built in `Integer#to_s`
# or `Integer#digits` methods in your implementation.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

#4322
def digital_root(num)

  while num > 10
    num = digital_root_step(num)
  end
    num
end

def digital_root_step(num)
  root = 0

  while num > 10
    root += num % 10  # 432 -> 2 returns last digit
    num =  num / 10  #432 -> 43
    root += num if num < 10 
  end
  root
end

# Write a recursive method that returns the sum of the first n even numbers
# recursively. Assume n > 0.
#n    1  2  3   4   5
#2n   2  4  6   8   10
#sum  2  6  12  20  30
def first_even_numbers_sum(n)
  return 2 if n == 1
  first_even_numbers_sum(n-1) + n*2

end

# Write a method that returns b^n recursively. Your solution should accept 
# negative values for n.
 

  def exponent(b, n)
    return 1 if n == 0
    if n > 0 
      b * exponent(b, n-1)
    else 
      1.0/b * exponent(b, n+1)
    end  
  end

class Array
  # Define a method `Array#my_zip(*arrays)` that merges elements from the 
  # receiver with the corresponding elements from each provided argument. You 
  # CANNOT use Ruby's built-in `Array#zip` method

  # example => [1,2,3].my_zip([4,5,6], [7,8,9]) 
  # should return => [[1,4,7], [2,5,8], [3,6,9]]
  # example => [1,2,3].my_zip([4,5], [7]) 
  # should return => [[1,4,7], [2,5,nil], [3,nil,nil]]

  def my_zip(*arrays) 
    result = [self] + arrays
    width = self.length
    height = result.length
    (0...width).map do |i|
      (0...height).map do |j|
        result[j][i]
      end
    end   
  end
end


class Array
  # Write an `Array#my_flatten` method that takes a multi-dimentional array and 
  # returns a single array of all the elements.
  #
  # Example: `[1,[2,3], [4,[5]]].my_flatten` => [1,2,3,4,5]  
  def my_flatten
    return self if !self.is_a? Array
    result = []
    self.each do |ele|
      if ele.is_a? Array
        result += ele.my_flatten 
      else 
        result << ele
      end
    end
    result
  end
  # Write an `Array#my_controlled_flatten(n)` method that only flattens n levels 
  # of an array. For example, if you have an array with 3 levels of nested 
  # arrays, and run `arr.my_flatten(1)`, you should return an array with 1 
  # level of nested arrays flattened.
  #
  # Example: `[1,[2,3], [4,[5]]].my_controlled_flatten(1)` => [1,2,3,4,[5]]

  def my_controlled_flatten(n=nil)   
     return self.my_flatten if n.nil? 
    result = [] 
    while n > 0
      self.each do |ele|
        if !ele.is_a? Array
          result << ele        
        else
          result += ele
        end
      end
      n -= 1
    end
    result
  end

end


