class Oystercard
  MAX_BALANCE = 90

  attr_reader :balance

  def initialize
    @balance = 0
    @limit = MAX_BALANCE
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

end
#
