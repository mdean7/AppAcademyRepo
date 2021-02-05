# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / (self.length * 1.00)
  end

  def median
   return nil if self.empty?
        self.sort!

    if (self.length).odd?
        self[self.length/2]
    else   
       (self[(self.length/2)- 1] + self[self.length/2]) / 2.0
    end
   end

    def counts
        hash = Hash.new(0)
        self.each {|ele| hash[ele] +=1}
         hash
    end

    def my_count(any_value)
        self.select{|ele| ele == any_value}.length
    end

    def my_index(any_value)
        self.each.with_index do |ele, i|
            if ele == any_value
                return i 
            end
        end
        nil
    end

    def my_uniq
        result = {}

        self.each {|ele| result[ele] = true}
        result.keys
    end

    def my_transpose
        length = self.first.length
   
        (0...length).map do |i|            
            self.map do |arr|
              arr[i]
            end
        end 
    end 

end
