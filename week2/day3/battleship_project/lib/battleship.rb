require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(board_length)
        @player = Player.new
        @board = Board.new(board_length)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
      puts "Number of ships: #{@board.num_ships}"
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "You lose"
            return true
        else
            return false
        end
    end

        def win?
            if @board.num_ships == 0 
                puts "You win"
                return true
            else
                return false
            end
        end

    
        def game_over?
            if win? || lose?
                return true
            else
                return false
            end
        end

        def turn            
           if !@board.attack(@player.get_move)
                @remaining_misses -= 1
                @board.print
              puts  @remaining_misses
            else
               @board.print
             puts   @remaining_misses
            end
        end
end
