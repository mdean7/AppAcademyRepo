require_relative "room"

class Hotel
  attr_reader :rooms
    def initialize(name, hash)
        @name = name
        @rooms = {}       
        hash.each{|room, cap| @rooms[room] = Room.new(cap)}
    end

    def name
        @name.split(' ').map! {|word| word.capitalize}.join(' ')
    end

    def room_exists?(room)
        @rooms.keys.include?(room)
    end

    def check_in(person, room)
      if room_exists?(room)
        if @rooms[room].add_occupant(person)
            puts 'check in successful'
        else
            puts 'sorry, room is full' 
        end
      else
        puts 'sorry, room does not exist'
      end
    end

    def has_vacancy?
        @rooms.any? {|k,v| !v.full?}
    end

    def list_rooms
        @rooms.each do |k, v|
            puts k +' '+ v.available_space.to_s
        end
    end


end


