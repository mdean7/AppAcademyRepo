
class Card

    CARDS = ("A".."Z").to_a

    attr_reader :face, :face_up

    def self.random_card
        Card.new(CARDS.sample)
    end

    def initialize(face, face_up=false)
        @face = face
        @face_up = face_up
    end

    def reveal
        @face_up = true
    end

    def hide
        @face_up = false
    end

    def to_s
        self.face.to_s
    end

    def ==(other_card)
        self.to_s == other_card.to_s
    end

    def revealed?
        self.face_up
    end



end