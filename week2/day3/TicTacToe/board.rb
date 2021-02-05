class Board
attr_reader :grid

    def initialize
        @grid = Array.new(3){Array.new(3, '_')}

    end

    def valid?(pos_arr)
       pos_arr.all?{|i| i < 3 && i >= 0}        
    end

    def empty?(pos_arr)
        row, col = pos_arr
        @grid[row][col] == '_'
    end
    
    def place_mark(pos_arr, mark)
        if self.valid?(pos_arr) && self.empty?(pos_arr)
            row, col = pos_arr
            @grid[row][col] = mark
        else
            raise "ERROR WILL ROBINSON!!!"
        end
    end

    def print
        self.grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        self.grid.any? {|row| row.all?{|ele| ele == mark} }
    end

    def win_col?(mark)
       rotated_grid = @grid.transpose
       rotated_grid.any? {|row| row.all?{|ele| ele == mark} }
    end
    
    def win_diagonal?(mark)
        count = 0
        i=0
        while i < @grid.length
          count += 1 if @grid[i][i] == mark
          i += 1
          return true if count == 3
        end

        i = 0
        j = @grid.length-1
        count = 0
        while i < @grid.length
            count += 1 if @grid[i][j] == mark
            i += 1
            j -= 1
            return true if count == 3
        end
        return false
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)        
    end

    def empty_positions?
        @grid.flatten.include?('_')
    end

end


