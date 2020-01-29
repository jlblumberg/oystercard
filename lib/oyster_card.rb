class OysterCard
    attr_reader :balance, :entry_station, :journeys

    CARD_LIMIT = 90
    MINIMUM_FARE = 1

    def initialize
        @balance = 0
        @journeys = []
    end

    def top_up(amount)
        raise "Cannot top up over the £#{CARD_LIMIT} limit!" if (@balance + amount) > CARD_LIMIT
        @balance += amount
    end

    def in_journey?
        !@entry_station.nil?
    end

    def touch_in(station)
        raise "Insufficient funds for travel - £1 minimum required" if @balance < MINIMUM_FARE
        @entry_station = station
        @current_journey = {entry: "#{station}"}
    end

    def touch_out(exit_station)
        deduct(MINIMUM_FARE)
        @entry_station = nil
        @current_journey.merge!(exit: "#{exit_station}")
    end

    private
    def deduct(fare)
        @balance -= fare
    end
end