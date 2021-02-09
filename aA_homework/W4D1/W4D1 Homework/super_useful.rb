# PHASE 2
# def convert_to_int(str)
#   Integer(str)
# end

# PHASE 3
FRUITS = ["apple", "banana", "orange", "lemon", "pineapple"]

class CoffeeError < StandardError
  def message
    "I love coffe but need fruits..."
  end
end

class NotFruitError < StandardError
  def message
    "That aint no fruit!"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"

  elsif maybe_fruit == 'coffee'
    raise CoffeeError
  else
    raise NotFruitError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    puts e.message
    retry
  rescue NotFruitError => e
    puts e.message
    retry
  end
end

# PHASE 3
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("Please enter a 'name' ") if name.empty?
    raise ArgumentError.new("'yrs_known' must be over 5 to be besties") if yrs_known.to_i < 5
    raise ArgumentError.new("Please enter a 'fav_pasttime' ") if fav_pastime.empty?

    @name = name
    @yrs_known = yrs_known.to_i
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known} years."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

