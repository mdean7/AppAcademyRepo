class Flight
attr_reader :passengers
    def initialize(flight_number_str, capacity)
        @flight_number = flight_number_str
        @capacity = capacity
        @passengers = []
    end

    def full?
         self.passengers.length >= @capacity 
    end

    def board_passenger(passenger)
        return "flight is full" if self.full?
        if passenger.has_flight?(@flight_number)
            @passengers << passenger
        else 
            return "flight number incorrect for passenger"
        end
    end

    def list_passengers
        self.passengers.map {|pass| pass.name}
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        self.board_passenger(passenger)
    end

end