class Board

    attr_reader :size

    def initialize(size)
        @size = size
        @grid = Array.new(@size){Array.new(@size, '_')}

    end


    def [](pos)#[0, 0]
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row, col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.any?{|row| row.all?{|ele| ele == mark}}
    end

    def complete_col?(mark)
        @grid.transpose.any?{|row| row.all?{|ele| ele == mark}}
    end

    def complete_diag?(mark)
        rotated = @grid.transpose.map(&:reverse)
        ((0...@size).all? {|i|  @grid[i][i] == mark}) || ((0...@size).all? {|i|  rotated[i][i] == mark})
    end

    def winner?(mark)
    complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end
    
    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end


# board player tictactoe