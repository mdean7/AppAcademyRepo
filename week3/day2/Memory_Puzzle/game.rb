
require_relative 'board.rb'
require_relative 'card.rb'

class Game

    attr_reader :player 

    def initialize(player, n)
        @player = player
        @board = (Board.new(n))
        @previous_guess = []
        @current_guess = []
    end

    def play
       
        @board.populate
        self.pick
    end
    
    def pick
        while !@board.won?
            @current_guess = []
            input = nil
            until input 
                puts "#{@player} please pick your first card"
            
            @board.render
            input = gets.chomp                    
            input = input.split(" ").map(&:to_i)
                if !is_valid?(input)
                    puts "INAVLID INPUT.  Try again."
                    input = nil
                end
            @current_guess << input
            @board[@current_guess[0]].reveal
        end

        input2 = nil
        until input2
            puts "#{@player} please pick your second card"
            @board.render
            input2 = gets.chomp        
            input2 = input2.split(" ").map(&:to_i)
                if !is_valid?(input2) && input != input2
                    puts "INAVLID INPUT  Try again."
                    input2 = nil
                end
                     @current_guess << input2
                     @board[@current_guess[1]].reveal
        end
            if @board[@current_guess[0]] == @board[@current_guess[1]]
                @previous_guess += @current_guess
                @board[@current_guess[0]].reveal
                @board[@current_guess[1]].reveal
            else
                @board[@current_guess[0]].hide
                @board[@current_guess[1]].hide
            end
        end
        puts "You win!!!!!"
    end

    def is_valid?(pos)
        
        row, col = pos
        return false if (row < 0 || row > @board.size) || (col < 0 || col > @board.size)
        return false if @previous_guess.include?(pos)
        true
    end
    





end