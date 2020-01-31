class OysterCard
    attr_reader :balance, :journeys, :journey

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
        !@current_journey.nil?
    end

    def touch_in(entry_station)
        raise "Insufficient funds for travel - £1 minimum required" if @balance < MINIMUM_FARE
        @entry_station = entry_station
        @current_journey = true
        @journey = Journey.new(entry_station)
        @journey.start(entry_station)
    end

    def touch_out(exit_station)
        deduct(MINIMUM_FARE)
        @journey.exit(exit_station)
        @journeys << @journey.full_journey
        @current_journey = nil
    end

    private
    def deduct(fare)
        @balance -= fare
    end
end