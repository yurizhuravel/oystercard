require 'oystercard'

describe Oystercard do

  subject(:card) { Oystercard.new }

  describe '#balance' do
    it 'has a starting balance of zero' do
      expect(card.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'tops up card by amount' do
      expect{card.top_up 1 }.to change{card.balance}.by 1
      expect(card.top_up(5)).to eq 6
    end

    it 'it has a maximum balance of 90' do
      card.top_up(Oystercard::MAX_BALANCE)
      expect{card.top_up(1)}.to raise_error "Exceeds £#{Oystercard::MAX_BALANCE} card limit"
    end
  end

  describe '#deduct' do
    it 'deducts fare from card' do
      card.top_up 10
      expect{card.deduct 5}.to change{card.balance}.by -5
    end
  end

  it 'raises an error when balance under 1' do
    expect{card.touch_in}.to raise_error 'Insufficient balance'
  end

  describe '#in_journey?' do
    it 'initialy is not in journey' do
      expect(card).not_to be_in_journey
    end
  end

  describe '#touch_in/touch_out' do

    before :each do
      card.top_up 10
      card.touch_in
    end

    it 'touches card in' do
      expect(card).to be_in_journey
    end

    it 'touches card out' do
      card.touch_out
      expect(card).not_to be_in_journey
    end
  end
end
