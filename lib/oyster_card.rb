class OysterCard
    attr_reader :balance
    attr_writer :state

    CARD_LIMIT = 90
    MINIMUM_BALANCE = 1

    def initialize
        @balance = 0
        @state = false
    end

    def top_up(amount)
        raise "Cannot top up over the £#{CARD_LIMIT} limit!" if (@balance + amount) > CARD_LIMIT
        @balance += amount
    end

    def deduct(fare)
        @balance -= fare
    end

    def in_journey?
        @state
    end

    def touch_in
        raise "Insufficient funds for travel - £1 minimum required" if @balance < MINIMUM_BALANCE
        @state = true
    end

    def touch_out
        @state = false
    end

end