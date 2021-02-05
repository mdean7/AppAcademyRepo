def my_map!(arr, &blc)
   
    arr.each.with_index do |ele, i|
        arr[i] = blc.call(ele)
    end

end

def two?(arr, &blc)
arr.count(&blc) == 2
end

def nor_select(arr, prc1, prc2)
arr.select{|ele| (!prc1.call(ele) && !prc2.call(ele))}
end

def array_of_hash_sum(arr)
    result = []

    arr.each do |hash|
        hash.each {|k, v| result << v}
    end

result.sum
end

def slangify(sentence)
words = sentence.split(' ')

    result = words.map{|word| vowelremover(word)}

result.join(' ')
end

def vowelremover(word)
vowels = 'aeiouAEIOU'

    word.each_char.with_index do |ele, i|
        if vowels.include?(ele)
            return (word[0...i] + word[i+1..-1])
        end
    end
    word
end

def char_counter(str, *chars)
 result = Hash.new(0)

    if chars.length == 0
        str.each_char {|letter| result[letter] +=1 }
        return result
    else
        chars.each do |cha|
         result[cha] = 0
         str.each_char {|letter| result[cha] +=1 if cha == letter}
         end             
         return result
    end
end