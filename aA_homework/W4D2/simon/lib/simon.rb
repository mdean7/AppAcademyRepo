class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    play
  end

  def play
    until @game_over == true
    take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn    
    show_sequence 
    require_sequence
    if @game_over == false
      round_success_message
      @sequence_length += 1
    end    
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
    end  
    sleep(3)
    system 'clear'
  end

  def require_sequence
    puts "Please repeat the sequence."    
    
    @seq.each.with_index do |color, i|
      puts "What were the colors?"
      input = gets.chomp
      system 'clear'
        if input != color
          @game_over = true
          break
        end  
    end        
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "A winner is you!!!!"
  end

  def game_over_message
    puts "Woopsie poopsie wrong color macaronni!"
    puts "Maybe see an eye doctor?"
    puts "Would you like to play again?"
    input = gets.chomp
    input == 'yes' ? Simon.new : return
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
Simon.new