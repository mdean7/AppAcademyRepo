require_relative "code"

class Mastermind
   def initialize(length)
    @secret_code = Code.random(length)
   end

   def print_matches(guess)

   puts "Exact: " + @secret_code.num_exact_matches(guess).to_s
   puts "Near: " + @secret_code.num_near_matches(guess).to_s
   end

   def ask_user_for_guess
    puts "Enter a code my dude:"   
    guess = Code.from_string(gets.chomp)
   print_matches(guess)
    guess == @secret_code
   end

end
