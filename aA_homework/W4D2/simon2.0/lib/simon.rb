class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = [] 
    
    system 'echo "███████╗██╗███╗   ███╗ ██████╗ ███╗   ██╗
    ██╔════╝██║████╗ ████║██╔═══██╗████╗  ██║
    ███████╗██║██╔████╔██║██║   ██║██╔██╗ ██║
    ╚════██║██║██║╚██╔╝██║██║   ██║██║╚██╗██║
    ███████║██║██║ ╚═╝ ██║╚██████╔╝██║ ╚████║
    ╚══════╝╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝" | lolcat -a'
    sleep(2)

    system "echo '▄▄▄▄·  ▄· ▄▌    
    ▐█ ▀█▪▐█▪██▌    
    ▐█▀▀█▄▐█▌▐█▪    
    ██▄▪▐█ ▐█▀·.    
    ·▀▀▀▀   ▀ •     
    • ▌ ▄ ·. ·▄▄▄▄  
    ·██ ▐███▪██▪ ██ 
    ▐█ ▌▐▌▐█·▐█· ▐█▌
    ██ ██▌▐█▌██. ██ 
    ▀▀  █▪▀▀▀▀▀▀▀▀•' |lolcat"

    sleep(2)
     system 'clear'
    play
  end

  def play
    system 'clear'
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
      sleep(0.5)
      system 'clear'
    end      
    system 'clear'
  end

  def require_sequence      
    
    @seq.each.with_index do |color, i|
      if i == 0
        puts "What was the 1st color?"
      elsif i == 1
        puts "What was the 2nd color?"
      elsif i == 2
        puts "What was the 3rd color?"
      elsif i > 2
        puts "What was the #{i+1}th color?"
      end
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
    3.times do
      sleep(0.1)
    system "echo 'A winner is you!!!!' | lolcat "
    sleep(0.2)
    system 'clear'
    end
  end

  def game_over_message
    puts "Woopsie poopsie wrong color macaronni!"
    puts "Maybe see an eye doctor?"
    puts "Would you like to play again?"
    input = gets.chomp
    input == 'yes' ? Simon.new : good_bye
  end
def good_bye
  system 'clear'
  system " echo 'OK, but lets play again sometime!' | lolcat -a "
  system "echo '▄▄▄▄▄ ▄ .▄ ▄▄▄·  ▐ ▄ ▄ •▄ .▄▄ ·    
  •██  ██▪▐█▐█ ▀█ •█▌▐██▌▄▌▪▐█ ▀.    
   ▐█.▪██▀▐█▄█▀▀█ ▐█▐▐▌▐▀▀▄·▄▀▀▀█▄   
   ▐█▌·██▌▐▀▐█ ▪▐▌██▐█▌▐█.█▌▐█▄▪▐█   
   ▀▀▀ ▀▀▀ · ▀  ▀ ▀▀ █▪·▀  ▀ ▀▀▀▀    
  ·▄▄▄      ▄▄▄                      
  ▐▄▄·▪     ▀▄ █·                    
  ██▪  ▄█▀▄ ▐▀▀▄                     
  ██▌.▐█▌.▐▌▐█•█▌                    
  ▀▀▀  ▀█▄▀▪.▀  ▀                    
   ▄▄▄·▄▄▌   ▄▄▄· ▄· ▄▌▪   ▐ ▄  ▄▄ • 
  ▐█ ▄███•  ▐█ ▀█▐█▪██▌██ •█▌▐█▐█ ▀ ▪
   ██▀·██▪  ▄█▀▀█▐█▌▐█▪▐█·▐█▐▐▌▄█ ▀█▄
  ▐█▪·•▐█▌▐▌▐█ ▪▐▌▐█▀·.▐█▌██▐█▌▐█▄▪▐█
  .▀   .▀▀▀  ▀  ▀  ▀ • ▀▀▀▀▀ █▪·▀▀▀▀ ' |lolcat"
  
  
  sleep(2)
  system 'clear'
  return
end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
Simon.new