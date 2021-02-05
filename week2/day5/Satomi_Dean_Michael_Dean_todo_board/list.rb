require './item.rb'

class List
    LINE_WIDTH = 42
    INDEX_COL_WIDTH = 5
    ITEM_COL_WIDTH = 20
    DEADLINE_COL_WIDTH = 10

attr_accessor :label
    def initialize(label)
        @label = label
        @items = []

    end

    def add_item(title, deadline, description='')
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        (0...@items.length).include?(index)      
    end

    def swap(i1, i2)
        if !self.valid_index?(i1) || !self.valid_index?(i2)
            return false
        else 
            @items[i1], @items[i2] = @items[i2], @items[i1]
        end
    end

    def [](index)
        if self.valid_index?(index)
            @items[index]
        else 
            return nil 
        end
    end
    
    def priority
        @items.first
    end

    def print
        puts "-" * LINE_WIDTH
        puts " " * 16 + self.label.upcase
        puts "-" * LINE_WIDTH
        puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)}"
        puts "-" * LINE_WIDTH
        @items.each_with_index do |item, i|
            puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)}"
        end
        puts "-" * LINE_WIDTH

    end
    def print_full_item(index)
        item = self[index]
        return if item.nil?
        puts "-" * LINE_WIDTH
        puts "#{item.title.ljust(LINE_WIDTH/2)}#{item.deadline.rjust(LINE_WIDTH/2)}"
        puts item.description
        puts "-" * LINE_WIDTH
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(index, amount=1)
        
        if valid_index?(index) 
            i = index
            amount.times do |num|
                if i == 0 
                    break
                end            
            swap(i, i-1)
             i-=1  
            end
        else 
            return false

        end        
    end

    def down(index, amount=1)
        
        if valid_index?(index) 
            i = index
            amount.times do |num|
                if i == @items.length-1
                    break
                end
            
                swap(i, i+1)
                i+=1
            end
        else
            return false
        end        
    end

    def sort_by_date!
        @items.sort_by!{|item| item.deadline}
    end

end

