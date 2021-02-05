def average(num1, num2)
    return (num1 + num2)/2.0
end

def average_array(arr)
    (arr.sum) / (arr.length * 1.0)
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + '!'
end

def alternating_case(str)
    str = str.split(' ')
    str.each.with_index do |word, i|
    i.even? ?  str[i] = word.upcase : str[i] = word.downcase
    end
    str.join(' ')
end