

class Oystercard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance, :in_journey

  def initialize(balance = DEFAULT_BALANCE)
      @balance = balance
      @in_journey = false
  end

  def top_up(amount)
      fail "card limitted to £90" if limit_reached(amount)
      @balance += amount
  end

  def limit_reached(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def deduct(amount)
      @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
