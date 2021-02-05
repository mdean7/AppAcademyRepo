class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def initialize(chars)
    if !Code.valid_pegs?(chars)
      raise 'The pegs are not valid'
    else
      @pegs = chars.map{|char| char.upcase}
    end
  end

  def self.random(total_chars)
    arr = []
    total_chars.times { arr << POSSIBLE_PEGS.keys[rand(0...4)] }    
    Code.new(arr)
  end

  def self.from_string(string_of_pegs)
    Code.new(string_of_pegs.split(''))
  end
  
  def [](index)
    @pegs[index]
  end
  
  def length
    @pegs.length
  end

  def num_exact_matches(guess)#guess is an instance of Code{Code:#000129309238498327, @pegs=[ "G", "Y", "R", "B"]}
    count = 0
    guess.pegs.each.with_index do |peg, i| #guess.pegs = [ "G", "Y", "R", "B"]
      if guess.pegs[i] == self.pegs[i]  
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each.with_index do |peg, i| #guess.pegs = [ "G", "Y", "R", "B"]
      if guess.pegs[i] != self.pegs[i] && self.pegs.include?(peg)
        count += 1
      end
    end
    count
  end

  def ==(guess)
    self.pegs == guess.pegs
  end


end

