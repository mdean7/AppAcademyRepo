def  palindrome?(str)
   
    i = 0
    while i < str.length / 2
        if str[i] != str[-1 - i]
            return false
        end
        i+=1
    end
    true
end

def substrings(str)
    i = 0
    result = []
    while i < str.length
        temp = ''
        temp += str[i]
        result << temp
        j = i+1
        while j < str.length          
            temp += str[j]
            result << temp
            j+=1
        end
        i+=1
    end
    result
end

def palindrome_substrings(str)
substrings(str).select {|ele| palindrome?(ele) && ele.length > 1}
end