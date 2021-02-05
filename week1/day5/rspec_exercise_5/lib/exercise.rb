def zip(*arr)
height = arr.length
width = arr[0].length
result = []

    i = 0
    while i < width

        sbox = []
        j = 0
        while j < height
            sbox << arr[j][i]           
            j += 1
        end
        result << sbox
        i+=1
    end 
 result
end


def prizz_proc(arr, p1, p2)

    arr.select {|e| (p1.call(e) && !p2.call(e)) || (!p1.call(e) && p2.call(e))}

end

def zany_zip(*arr)

    theBigArr = arr.max_by { |a| a.size }
    height = arr.length
    width = theBigArr.length
    result = []

    i = 0
    while i < width

        sbox = []
        j = 0
        while j < height
            sbox << arr[j][i]         
            j += 1
        end
        result << sbox
        i+=1
    end 
    result
end

def maximum(arr, &prc)
    arr.reverse.max_by {|el| prc.call(el)}
end

def my_group_by(arr, &prc)

    result = Hash.new(){|h, k| h[k] = []}
    arr.each { |ele| result[prc.call(ele)] << ele}
    result
end

def max_tie_breaker(arr, prc, &blc)
return nil if arr.empty?
    
   filter1 = arr.map {|ele| blc.call(ele)}.sort 
      

end



def max_tie_breaker(array, tie_breaker, &prc)
    return nil if array.empty?
    max = array.first
    array.each do |el|
        result_el = prc.call(el)
        result_max = prc.call(max)
        if result_el > result_max
            max = el
        elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
            max = el
        end
    end
    max
end
# def silly_syllables()

# end