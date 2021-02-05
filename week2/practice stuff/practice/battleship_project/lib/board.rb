class Board
    attr_reader :size

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(' ')
        end
    end

    def initialize(n)
        @grid = Array.new(n){Array.new(n, :N)}
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end   


    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end  


    def num_ships
        @grid.flatten.count{|ele| ele == :S}
    end

    def attack(pos)
      if self[pos] == :S
        self[pos] = :H
        puts "you sunk my battleship!"
        return true
      else
        self[pos] = :X
        return false
      end
    end

    def place_random_ships
       total_S = @size * 0.25
        while num_ships < total_S
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)
            @grid[row][col] = :S
        end
    end  
    
    def hidden_ships_grid
       
        @grid.map do |arr|
            arr.map do |ele|
                if ele == :S
                    ele = :N
                else
                    ele
                end
            end
        end
    end

    def cheat
       Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
     end

end
