

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 1
  attr_reader :balance, :in_journey

  def initialize
      @balance = 0
      @in_journey = false
  end

  def top_up(amount)
      fail "card limitted to £90" if limit_reached(amount)
      @balance += amount
  end

  def limit_reached(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def in_journey?
    @in_journey
  end

  def touch_in
      fail 'Not enough money on card' if balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_journey = false
  end

private

  def deduct(amount)
      @balance -= amount
  end

end
