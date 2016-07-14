class Journey
  DEFAULT_ENTRY = nil
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station
  attr_accessor :journey_history

  def initialize(station = DEFAULT_ENTRY)
    @entry_station = station
  end

  def complete?
    @entry_station && @exit_station
  end

  def fare
    @exit_station == nil ? PENALTY_FARE : Oystercard::MINIMUM_FARE
  end

  def finish(station)
    @exit_station = station
    self
  end
end
