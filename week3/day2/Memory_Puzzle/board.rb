require_relative 'card.rb'

class Board
    CARDS = ("A".."Z").to_a

attr_reader :grid, :size

    def initialize(size)
        @grid = Array.new(size){Array.new(size, ' ')}
        @size = size        
    end

    def populate 
        unique_amt = @size * @size / 2
        unique_cards = CARDS.sample(unique_amt)
        # dups = unique_cards.dup
        i = 0
        @grid.map.with_index do |row, idx|            
            row.map.with_index do |ele, idx2|
                row[idx2] = Card.new(unique_cards[i])
                i = (i + 1) % unique_amt
                row[idx2]                
            end           
        end      
         @grid = @grid.flatten.shuffle.each_slice(@size).to_a
    end

    def render
     copy = @grid.dup.map(&:dup)   
     render = copy.each_with_index do |row|           
           row.each_with_index do |ele, j|
                if ele.face_up
                   row[j] = ele.to_s
                else
                    row[j] = ' '                
                end
           end
        end
       
        render.each do |row|
            puts row.join(" ")
        end
    end


    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end 
    
    def board_revealed?(pos)
        self[pos].revealed?
    end

    def reveal(pos)
       if !board_revealed?(pos)
        self[pos].reveal
        self[pos].to_s
       else
        self[pos].to_s
       end
    end

    def won?
        @grid.any? do |row|
            row.any? {|ele| ele.revealed?}
        end
    end
#render should print out a representation of the Board's current state
#won? should return true if all cards have been revealed.
#reveal should reveal a Card at guessed_pos 
#(unless it's already face-up, in which case the method should do nothing). 
#It should also return the value of the card it revealed (you'll see why later).
 


 

    



    

    
end