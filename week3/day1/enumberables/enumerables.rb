 class Array

    def my_each(&prc)

        i = 0
        while i < self.length
            prc.call(self[i])
            
            i += 1
        end
        self
    end

    def my_select(&prc)

        result = []
        self.my_each {|ele| result << ele if prc.call(ele)}
        result

    end

    def my_reject(&prc)
        result = []
        self.my_each {|ele| result << ele if !prc.call(ele)}
        result       

    end

    def my_any?(&prc)

        # include?((select &prc)[0]) <--LOL
                
       (my_select &prc).length > 0

    end

    def my_all?(&prc)

        (my_select &prc).length == self.length

    end

    def my_flatten(subs=nil)

        # subs ||= self
        # return [subs] if !subs.is_a? Array

        # result = []
        
        # subs.map do |subarray|
        #     result += my_flatten(subarray) 
        # end
        # result 

        result = []
        self.each do |subarray|
           result += subarray if !subarray.is_a? Array
        else
           result += subarray.my_flatten
        end
        result
    end

    def my_zip(*args)

        result_sub_length = args.length + 1
        
        result = []
        self.each.with_index do |num, i|
            temp = [num]
            while temp.length < result_sub_length 
                args.each do |subarr|
                    temp << subarr[i]
                end
            end
            result << temp
        end        
        return result
    end

    def my_rotate(n=1)
        if n > 0
            n.times do |i|
                ele = self.shift
                self.push(ele)
            end
        else
            (n).abs.times do |i|
                ele = self.pop
                self.unshift(ele)
            end
        end
        self
    end

# arr[i][i]  left to right  i++
# [](pos)
# pos = [i, i]
# self[pos] == ele
# arr[i][j] right left   i-- J++
     
    def my_join(s='')
        
        str = ''
        each do |char|
            str += char + s
        end
        return str
    end


    def my_reverse
        
        

    end

    
 end
 
