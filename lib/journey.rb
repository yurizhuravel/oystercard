class Journey
  DEFAULT_ENTRY = nil
  PENALTY_FARE = 6
  attr_reader :entry_station
  attr_accessor :journey_history, :exit_station

  def initialize(station = DEFAULT_ENTRY)
    @entry_station = station
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare
    complete? ? Oystercard::MINIMUM_FARE : PENALTY_FARE
  end

  def finish(station)
    @exit_station = station
    self
  end
end
