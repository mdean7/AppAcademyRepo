# Recursion
# Recursive methods
# Warmup

    def my_range(start, fin)
        result = []
        return [] if fin < start 
        return result if result.length == (fin - start)
        result = [start] + my_range((start + 1), fin)
    
    end

p my_range(1, 4)

p my_range(1, 10)

# Write both a recursive and iterative version of sum of an array.

    def recursive_sum_arr(arr)
        return arr[0] if arr.length == 1

        arr[0] + recursive_sum_arr(arr[1..-1])
    end

    p recursive_sum_arr([1,2,3])

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

def rec1_exp(b, n)
    return 1 if n == 0
    return b if n == 1

    b * rec1_exp(b, n-1)
end
p rec1_exp(2, 3) # => 8

# recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]

def rec2_exp(b, n)
    return 1 if n == 0
    return b if n == 1
    return (rec2_exp(b, (n/2)) * rec2_exp(b, (n/2))) if n.even?
    return b * (rec2_exp(b, ((n - 1)/2)))*(rec2_exp(b, ((n - 1)/2))) if n.odd? 
end
p rec2_exp(2, 3) # => 8
p rec2_exp(5, 4) # => 625

# Using recursion and the is_a? method, write an Array
#deep_dup method that will perform a "deep" duplication of the interior arrays.

def deep_dup_do(arr)
    return arr[0] if !arr.is_a? Array
    result = []
    arr.each {|ele| result << deep_dup_do(ele)}
    result
end

p deep_dup_do( [[1, [1,2,[1,2]]], [2]] )


# Fibonacci
# Write a recursive and an iterative Fibonacci method. 
# The method should take in an integer n 
# and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; 
# you should be able to do this just passing a single argument 
#     for the number of Fibonacci numbers requested.

def recYou_fib(n)
    #base case
     return [0] if n == 1
    return [0,1] if n == 2   
   
    result = recYou_fib(n - 1) 
    result << result[-2] + result[-1]
  
    return result
  end
  
  p recYou_fib(6) 


def itr8r_fib(n)
    return [1] if n == 1 
    return [1, 1] if n == 2 
    result = [1,1,2]
    sum = 2
    prev_sum = 1
        while result.length < n
            result << sum + prev_sum
            prev_sum = sum
            sum = result[-1]
        end
    result
end

p itr8r_fib(4)


def bsearch(arr, target)
    return nil if arr.length == 0
    mid = arr.length/2    
    left = arr[0...mid]
    right = arr[mid+1..-1]

    return mid if arr[mid] == target

    if arr[mid] > target
        bsearch(left, target)       
    else
        sub_ans = bsearch(right, target)        
            if sub_ans == nil
                return nil 
            else 
                mid + 1 + sub_ans
            end
    end
end

bsearch([1, 2, 3], 1) # => 0
bsearch([2, 3, 4, 5], 3) # => 1
bsearch([2, 4, 6, 8, 10], 6) # => 2
bsearch([1, 3, 4, 5, 9], 5) # => 3
bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


    def merge_sort(arr)
    #The base cases are for arrays of length zero or one.
        return [] if arr.empty?
        return arr if arr.length == 1
        #split arr in 2 so u can sort and merge each half each step
        mid = arr.length/2
        left = arr[0...mid]
        right = arr[mid..-1]
        #use recursion to split up the halves down to the base cases
        #on those same bases cases use merge to organize and combine the pieces
       merge(merge_sort(left), merge_sort(right))
    end


    def merge(left, right)
        result = []        
        #we need to continually compare the arrays until one is shifted empty
        until left.empty? || right.empty? do
            # shift the smaller number off left or right and into result
            if left[0] < right[0]
                result.push(left.shift)
            else   
                result.push(right.shift)
            end
        end 
        #combine the result with left over arr and the empty one
         return result += left + right
    end
    
    merge_sort([3,2,5,1])


# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, 
# there is also a corresponding subset that is the same, except it also does contain 3.



    # def subsets_iteration(arr)
       
    #   result = [[]]
    #     (0...arr.length).each do |i|
    #         result << [arr[i]]
    #         (i+1...arr.length).each do |j|
    #             result << [arr[i]] + [arr[j]]
    #         end
    #     end
    #    return result.sort_by{|ele| ele.size}
    # end

    def subsets(arr)
        #base is the empty array
       return [[]] if arr.length == 0

        #to get recursion I need to take a piece of ur original arr each time
       smaller_arr = arr[1..arr.length-1]
       result = subsets(smaller_arr)

       #i add each ele of the smaller arr to the missing element in an array and map
       combos = result.map{ |ele| ele + [arr[0]] }
       
       #finally i add the array of combos to the result
       result += combos
    end

subsets([]) # => [[]]
subsets([1]) # => [[], [1]]
subsets([1, 2]) # => [[], [1], [2], [1, 2]]
subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]


    def permutations(array)

    end

p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]