class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

    def self.valid_pegs?(pegs)#array of chars
      pegs.all?{|peg| POSSIBLE_PEGS.keys.include?(peg.upcase)}
    end

    def self.random(length)
      result = []
      length.times{ result << POSSIBLE_PEGS.keys.sample}
    Code.new(result)
    end

    def self.from_string(pegstr)
      Code.new(pegstr.split(''))
    end

    def initialize(pegs)#array of chars
      if !Code.valid_pegs?(pegs)
        raise 'Oopsie poopsie these pegs are no bueno!'
      else
        @pegs = pegs.map(&:upcase)
      end
    end


    
    def [](index)
      @pegs[index]
    end

    def length
      @pegs.length
    end

    def num_exact_matches(guess)
      (0...guess.length).count{|i| guess[i] == @pegs[i]}
    end

    def num_near_matches(guess)#code instance of a guess
      count = 0    
      guess.pegs.each.with_index do |peg, i|
         if @pegs[i] != guess.pegs[i] && @pegs.include?(peg)
          count += 1
         end          
      end
        return count
    end

    def ==(guess)
      if guess.length != self.length
        return false      
      end
      self.pegs == guess.pegs
    end

end
