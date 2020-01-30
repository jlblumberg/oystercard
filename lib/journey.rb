require_relative 'oyster_card'

class Journey

  attr_reader :entry_station

  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @complete = false
  end

  def start
  end

  def exit(exit_station = nil)
    @exit_station = exit_station
    self
  end

  def fare
    PENALTY_FARE
  end

  def complete?
    @complete
  end

# starting a journey, 
# finishing a journey, (touch_out)
# calculating the fare of a journey, (#fare)
# returning whether or not the journey is complete. (#entry, exit and error)

end