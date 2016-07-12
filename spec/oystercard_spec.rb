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
      expect{card.top_up(1)}.to raise_error 'Exceeds card limit'
    end

  end

end
