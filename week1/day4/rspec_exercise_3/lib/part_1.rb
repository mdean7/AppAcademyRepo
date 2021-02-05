def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    true
end 

def nth_prime(n)
    count = 0
    i = 0
    while count < n     
        count += 1 if is_prime?(i)
        return i if count == n
        i += 1
    end   
end

def  prime_range(min, max)
    (min..max).select {|i|  is_prime?(i)}

end