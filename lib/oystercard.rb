class Oystercard
  MAX_BALANCE = 90
  MIN_FARE = 1
  attr_reader :balance, :entry_station, :journey_history

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    fail "Exceeds £#{MAX_BALANCE} card limit" if limit_reached(amount)
    @balance += amount
  end

  def limit_reached(amount)
    @balance + amount > MAX_BALANCE
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    fail 'Insufficient balance' if balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journey_history << {entry: @entry_station, exit: station}
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
#
