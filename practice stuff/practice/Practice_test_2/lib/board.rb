
class Board

    def self.build_stacks(num_of_stacks)
        Array.new(num_of_stacks){Array.new(0)}
    end

    def initialize(num_of_stacks, max_height)
        if num_of_stacks < 4 || max_height < 4
            raise 'rows and cols must be >= 4'
        end
        @max_height = max_height
        @stacks = Board.build_stacks(num_of_stacks)
    end

    def max_height()
        @max_height
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            return true
        else
            return false
        end
    end

    def vertical_winner?(token)
        @stacks.each do |stack|
          return true if  stack.all?{|toks| toks == token} && stack.length == @max_height
        end
        false
    end

    def horizontal_winner?(token)
      
        #using fill LOL
        # filled = @stacks.map{|row| row.fill(:X, @stacks.length, 0)}.transpose
        # filled.each do |stack|
        #     return true if  stack.all?{|toks| toks == token} && ((stack.count{|toks| toks == token}) == @stacks.length)
        #   end
        #   false
      
        #my solution while practicing for the test 
        # (0...@max_height).each do |ele_index|
        #     return true  if  @stacks.all? { |row| row[ele_index] == token}               
        # end
        # false

        #one liner
         (0...@max_height).any? { |ele_index| return true  if  @stacks.all? { |row| row[ele_index] == token}}

        #BUMBACA SOLUTION
            # (0...max_height).each do |row_idx|
            #   if (0...@stacks.length).all? do |stack_idx|
            #     @stacks[stack_idx][row_idx] == token
            #     end
            #     return true
            #   end
            # end
            # false
          
    end

 

    def winner?(token)
       self.vertical_winner?(token) || self.horizontal_winner?(token)
    end

    
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
#Order `Board`, `Player`, `ConnectTacToe`