class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance
  attr_accessor :in_journey

  def initialize
    @balance = 0
    @limit = MAX_BALANCE
    @in_journey = false
  end

  def top_up(amount)
    fail "Exceeds £#{MAX_BALANCE} card limit" if limit_reached(amount)
    @balance += amount
  end

  def limit_reached(amount)
    @balance + amount > @limit
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
#
