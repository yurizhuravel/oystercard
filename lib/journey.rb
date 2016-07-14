class Journey
  DEFAULT_ENTRY = nil
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station
  attr_accessor :journey_history

  def initialize(station = DEFAULT_ENTRY)
    @entry_station = station
  end

  def complete?
    false
  end

  def fare
    PENALTY_FARE
  end

  def finish(station)
    self
  end
end
