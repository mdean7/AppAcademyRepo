def element_count(arr)
obj = Hash.new(0)

arr.each {|ele| obj[ele] +=1}
return obj
end
# should return a hash where each key is an element of the array and


def char_replace!(str, hash)

    str.each_char.with_index do |ele, i|
        if hash.has_key?(str[i])
            str[i] = hash[str[i]]
        end
    end
    str
end

def product_inject(arr)
    arr.inject {|pro, i| pro*i}
end