require_relative'station.rb'
require_relative 'journey_history.rb'
require_relative 'journey.rb'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :journey
  attr_accessor :journey_history

  def initialize
      @balance = 0
      @journey_history = JourneyHistory.new
  end

  def top_up(amount)
      fail "card limitted to £90" if limit_reached(amount)
      @balance += amount
  end

  def limit_reached(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def no_money?
      balance < MINIMUM_FARE
  end

  def in_journey?
    !@journey.nil?
  end

  def touch_in(station)
      fail 'Not enough money on card' if no_money?
      @journey.finish(station) if in_journey?
      @journey = Journey.new(station)
    #@journey.store(:entry, station)
  end

  def touch_out(station)
    @journey.finish(station)
    deduct(@journey.fare)
    @journey = nil
  #  @journey.store(:exit, station)
  #  @journey_history << @journey
  #  @journey = {}
  end

private

  def deduct(amount)
      @balance -= amount
  end

end
