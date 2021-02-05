class Board

    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def valid?(position)
        x = position[0].abs
        y = position[1].abs
        x < 3 && y < 3
    end

    def empty?(position)
        x = position[0].abs
        y = position[1].abs
        @grid[x][y] == "_"
    end

    def place_mark(position, mark)
        if !self.valid?(position) || !self.empty?(position)
            raise 'You can not place your mark here.'
        end
        
        x = position[0].abs
        y = position[1].abs
        @grid[x][y] = mark
    end

    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.each do |row|
           if row.all? {|ele| ele == mark }
            return true
           end
        end
        return false
    end

    def win_col?(mark)
       @grid.uniq.each do |row|
            if row.all? {|ele| ele == mark }
                return true
            end
         end
         return false
    end
    
end


