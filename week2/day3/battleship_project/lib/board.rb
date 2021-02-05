class Board

    attr_reader :size
    
    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end



    def [](xyarr) 
        
        x = xyarr[0] 
        y = xyarr[1]
        @grid[x][y] 
    end

    def []=(xyarr, symbol)# [1, 2] [[123] [123] [123] ]
        x = xyarr[0] 
        y = xyarr[1]
        @grid[x][y] = symbol
    end

    def num_ships
        @grid.flatten.count { |sym| sym == :S } 
    end
    

    def attack(xyarr)# [ [N N N] [N S N] [S N N] ]
        
        if self[xyarr]  == :S
            self[xyarr] = :H
            p "You sunk my battleship!"
            return true
        else
            self[xyarr] = :X
            return false
        end    
    end
        
    def place_random_ships
        ships = @size * 0.25

        while self.num_ships < ships
            random_x = rand(0...@size**0.5)
            random_y = rand(0...@size**0.5)
            self.[]=([random_x, random_y],:S)
        end
    end

    def hidden_ships_grid
        
        @grid.map do |row|  
            row.map do |col| 
                if col == :S
                    :N
                else
                   col
                end
            end
        end
   end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

   

end
