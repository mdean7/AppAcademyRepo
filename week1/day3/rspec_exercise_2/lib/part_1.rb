def partition(arr, n)
    result = []
    left = []
    right = []
    arr.each do |i|
        if i < n
            left << i
        else
            right << i
        end
    end
    result << left
    result << right
end
def merge(hash1, hash2)
    obj = {}
    hash1.each {|k, v| obj[k] = v}
    hash2.each {|k, v| obj[k] = v}
    obj
end

def censor(str, arr)
    
    str = str.split(' ')

    str.each.with_index do |word, i|
        if arr.include?(word.downcase)
           str[i] = star(word)
        else
            word
        end
    end

    str.join(' ')
end

def star(word)
    vowels = 'aeiouAEIOU'
   word = word.split('')
    word.each_with_index do |char, i|
        if vowels.include?(char.downcase)
           word[i] = '*'
        else
            char
        end
    end
    word.join('')
end

def power_of_two?(num)
    i = 0
    while i <= num / 2 
      if 2 ** i == num
        return true
      end
      i+=1
    end
    false
end

