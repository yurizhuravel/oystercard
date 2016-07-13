require_relative'station.rb'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :journey
  attr_accessor :journey_history

  def initialize
      @balance = 0
      @journey_history = []
      @journey = {}
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
    !@journey.empty?
  end

  def touch_in(station)
      fail 'Not enough money on card' if no_money?
    @journey.store(:entry, station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey.store(:exit, station)
    @journey_history << @journey
    @journey = {}
  end

private

  def deduct(amount)
      @balance -= amount
  end

end
