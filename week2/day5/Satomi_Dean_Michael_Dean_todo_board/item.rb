

class Item
 attr_accessor :title, :description
 attr_reader :deadline
    def self.valid_date?(date_str)
        arr = date_str.split('-')
        y =  arr[0].length == 4  
        m =  (arr[1].length == 2 && (1..12).include?(arr[1].to_i))
        d =  (arr[2].length == 2 && (1..31).include?(arr[2].to_i))
        y && m && d
           
    end

    def initialize(title, deadline, description)
        @title = title
        Item.valid_date?(deadline) ? (@deadline = deadline ) : (raise "invalid date")
        @description = description
    end

    def deadline=(new_deadline)
        Item.valid_date?(new_deadline) ? (@deadline = new_deadline) : (raise "invalid date")
    end
    


end