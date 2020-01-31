require_relative 'oyster_card'

class Journey

  attr_reader :entry_station, :exit_station

  PENALTY_FARE = 6

  def initialize(entry_station = nil)
    @entry_station = entry_station
    @complete = false
  end

  def start(entry_station)
    @entry_station = entry_station
  end

  def exit(exit_station = nil)
    @fare = OysterCard::MINIMUM_FARE if !full_journey[:a].nil?
    @exit_station = exit_station
    @complete = true
    self
  end

  def fare
    return PENALTY_FARE if ( @entry_station.nil? || @exit_station.nil? )
    OysterCard::MINIMUM_FARE
  end

  def complete?
    @complete
  end

  def full_journey
    { :entry_station => @entry_station, :exit_station => @exit_station }
  end

end