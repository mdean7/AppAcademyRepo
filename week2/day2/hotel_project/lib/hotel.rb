require_relative "room"


class Hotel

    def initialize(hotel_name, hash)
        @name = hotel_name
        @rooms = {}

        hash.each {|room_name, cap|  @rooms[room_name] = Room.new(cap)}
      
    end  

    def name
        @name.split(' ').map {|word| word.capitalize }.join(' ')
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end
    end


    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            puts 'sorry, room does not exist'
        else
            if @rooms[room_name].add_occupant(person)
                puts 'check in successful'             
            else
                puts 'sorry, room is full'
            end
        end
        
    end
     
    def has_vacancy?
        @rooms.values.any? {|value| value.available_space > 0 }
    end
    
    def list_rooms
        @rooms.each do |k, v|
            puts "#{k} : #{v.available_space}"
        end
    end
 
end
