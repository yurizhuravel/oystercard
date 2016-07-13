require_relative'station.rb'

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station
  attr_accessor :journey_history

  def initialize
      @balance = 0
      @journey_history = []
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
    !!@entry_station
  end

  def touch_in(station)
      fail 'Not enough money on card' if no_money?
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @journey_history << {entry: @entry_station, exit: station}
    @entry_station = nil
  end

private

  def deduct(amount)
      @balance -= amount
  end

end
