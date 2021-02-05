Vowels = 'aeiouAEIOU'
def hipsterfy(str)
    str = str.reverse
    str.each_char.with_index do |cha, i|
        if Vowels.include?(cha)
            left = str[0...i]
            right = str[i+1..-1]
         return    (left + right).reverse
        end
    end
    return str.reverse
end

def vowel_counts(str)
str = str.split('')
result = Hash.new(0)
str.each {|cha| result[cha.downcase] += 1 if Vowels.include?(cha.downcase)}
result
end

def caesar_cipher(str, num)
    alph = ('a'..'z').to_a   
    str.each_char.with_index do |cha, i|
        if alph.include?(cha)
            str[i] = alph[(alph.index(cha) + num) % 26]
        end
    end
    str
end