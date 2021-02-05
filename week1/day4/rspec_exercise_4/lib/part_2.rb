def proper_factors(num)
(1...num).select {|i| num % i == 0 }

end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
   pnCount = 0
    i = 1
    result = []
    while pnCount < n
        if perfect_number?(i)
            result << i
            pnCount += 1
        end
        i += 1
    end
    result 
end