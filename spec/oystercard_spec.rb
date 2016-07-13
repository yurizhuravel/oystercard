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

  describe '#touch_in and #touch_out' do

    before(:each)do
      card.touch_in
    end

     describe '#touch_in' do
       it 'touches the card in' do
         expect(card).to be_in_journey
       end
     end

     describe '#touch_out' do
       it 'touches the card out' do
         card.touch_out
         expect(card).not_to be_in_journey
       end
     end
 end

end
