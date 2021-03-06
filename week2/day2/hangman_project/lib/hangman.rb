
  require 'byebug'
class Hangman

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize    
   
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word 
  end

  def attempted_chars 
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses 
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else 
      return false
    end    
  end

  def get_matching_indices(id_char)
    indices = []
    @secret_word.each_char.with_index do |secret_char, idx|
      if secret_char == id_char
        indices << idx
      end
    end
    indices
  end


  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }    
  end


  def try_guess(char)
    if char == @secret_word
       @guess_word = char.split('')
    end
    attempted = self.already_attempted?(char)
    indices = self.get_matching_indices(char)
    self.fill_indices(char, indices)

    if indices.length == 0 
      @remaining_incorrect_guesses -= 1 
    end 
    
    if attempted
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      return true
    end    
  end


  def ask_user_for_guess
    puts 'Enter a char:'
    guess = gets.chomp
    return self.try_guess(guess)

  end

  def win?
    if @guess_word.join("") == @secret_word
      puts 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
      if @remaining_incorrect_guesses == 0
        puts 'LOSE'
        return true
      else
        return false
      end
  end
  
  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end

end
