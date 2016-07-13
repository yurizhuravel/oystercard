require 'oystercard'

describe Oystercard do

subject(:card) {Oystercard.new }
let (:station) {double :station, zone: 1}

    it 'tells your balance is 0' do
      expect(card.balance).to eq 0
    end

    describe '#top_up' do
      it 'tells you when you top up' do
        expect{card.top_up(1)}.to change{card.balance}.by(1)
      end
   end

   it 'there is a £90 limit' do
     card.top_up((Oystercard::MAXIMUM_BALANCE))
      expect{card.top_up(1)}.to raise_error "card limitted to £#{Oystercard::MAXIMUM_BALANCE}"
   end

   it 'initially is not in journey' do
     expect(card).not_to be_in_journey
  end

    it 'initially has no journey history' do
      expect(card.journey_history).to eq []
    end

     describe '#touch_in' do
         it 'Requires minimum balance to touch in' do
         expect{card.touch_in(station)}.to raise_error'Not enough money on card'
         end
     end

  describe '#touch_in and #touch_out' do
    before(:each)do
      card.top_up(5)
      card.touch_in(station)
    end

       it 'stores the entry station' do
       expect(card.entry_station).to eq station
       end

       it 'touches the card in' do
         expect(card).to be_in_journey
       end

       it 'touches the card out' do
         card.touch_out(station)
         expect(card).not_to be_in_journey
       end

       it 'deducts the minimum fare on touch out' do
         expect{card.touch_out(station)}.to change{card.balance}.by(-Oystercard::MINIMUM_FARE)
       end

       it 'stores journey history' do
        card.touch_out(station)
        expect(card.journey_history).to eq [{:entry => station, :exit => station}]
       end

    end

end
