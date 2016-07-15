require 'journey'

class JourneyLog
  attr_reader :journey_history, :current_journey

  def initialize(journey_class: Journey)
    @journey_class = journey_class
    @journey_history = []
    @current_journey = nil
  end

  def start(entry_station)
    @current_journey = @journey_class.new(entry_station: entry_station)
    @journey_history << @current_journey
  end

  def finish(exit_station)
    @current_journey.finish(exit_station)
  end

  private

  # def current_journey
  #   @current_journey || @journey_class.new
  # end

end
