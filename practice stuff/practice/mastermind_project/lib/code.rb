class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr_of_chars)
    arr_of_chars.all?{|char| POSSIBLE_PEGS.include?(char.upcase)}

  end

  
  def self.random(length)
    random_pegs = []
    random_peg_choice = POSSIBLE_PEGS.keys
    while random_pegs.length < length
     random_pegs << random_peg_choice[rand(0..3)]
    end
    Code.new(random_pegs)
  end

  def self.from_string(pegs_str)     
    Code.new(pegs_str.upcase.split(''))
  end

    def initialize(pegs)
     if Code.valid_pegs?(pegs)
        @pegs = pegs.map!{|char| char.upcase}
     
      else
        raise 'These pegs are not valid.'
      end
    end

    def pegs
      @pegs
    end


    def [](index)
      self.pegs[index]
    end

    def length
      self.pegs.length
    end

    def num_exact_matches(guess)
      count = 0
      i = 0
        while i < @pegs.length
          if self[i] == guess[i]
            count +=1
          end
        i+=1
        end
        count
    end

    def num_near_matches(guess)
      count = 0
      i = 0
        while i < @pegs.length
          if self[i] != guess[i] && self.pegs.include?(guess[i])
            count +=1
          end
        i+=1
        end
        count
    end

    def  ==(guess)
        self.pegs == guess.pegs
    end

end
