def first_letter_vowel_count(sentence)
    vowels = 'aeiouAEIOU'
    words = sentence.split(' ')
    words.count {|word| vowels.include?word[0]}
end

def count_true(arr, prc)
    arr.count {|ele| prc.call(ele)}
end

def procformation(arr, prc1, prc2, prc3)
    arr.map do |ele|
        if prc1.call(ele)
         prc2.call(ele)
        else
         prc3.call(ele)
        end
    end
end

def array_of_array_sum(array_of_arrays)
    array_of_arrays.flatten.sum
end

def selective_reverse(sentence)
    vowels = 'aeiouAEIOU'
    words = sentence.split(' ')
    words.each.with_index do |word, i|
        if !vowels.include?(word[0]) && !vowels.include?(word[-1])
           words[i] = word.reverse
        end
    end
    words.join(' ')
end

def hash_missing_keys(hash, *args)
result = []
    args.each do |ele|
        if !hash.has_key?(ele)
            result << ele
        end
    end
result
end