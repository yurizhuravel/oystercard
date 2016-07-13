require 'oystercard'

describe Oystercard do

subject(:card) {Oystercard.new }

    it 'tells your balance is 0' do
      expect(card.balance).to eq 0
    end

    describe '#top_up' do
      it 'tells you when you top up' do
        expect{card.top_up(1)}.to change{card.balance}.by(1)
      end
   end

   it 'there is a £90 limit' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      card = Oystercard.new(maximum_balance)
      expect{card.top_up(maximum_balance)}.to raise_error "card limitted to £#{maximum_balance}"
   end

   it 'initially is not in journey' do
     expect(card).not_to be_in_journey
  end

   describe '#deduct' do
      it 'deducts the fee' do
        expect{card.deduct(1)}.to change{card.balance}.by(-1)
      end
   end

     describe '#touch_in' do
         it 'Requires minimum balance to touch in' do
         expect{card.touch_in}.to raise_error'Not enough money on card'
         end
     end

     describe '#touch_out' do
     end

  describe '#touch_in and #touch_out' do
    before(:each)do
        card.top_up(5)
      card.touch_in
    end

       it 'touches the card in' do
         expect(card).to be_in_journey
       end

       it 'touches the card out' do
         card.touch_out
         expect(card).not_to be_in_journey
       end
    end

end
