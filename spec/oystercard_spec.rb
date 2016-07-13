require 'oystercard'

describe Oystercard do
    
    subject(:card) {Oystercard.new }
    
    
    it 'tells your balance is 0' do
        expect(card.balance).to eq 0
    end
describe '#top_up' do
   it 'tells you when you top up' do 
       #expect(subject.top_up(1)).to eq 1 ======= Our code
       expect{card.top_up(1)}.to change{card.balance}.by(1)
      end
   end
   
   it 'there is a £90 limit' do
       maximum_balance = Oystercard::MAXIMUM_BALANCE
       card = Oystercard.new(maximum_balance)
       expect{card.top_up(maximum_balance)}.to raise_error "card limitted to £#{maximum_balance}"
   end
   
   describe '#deduct' do
       it 'deducts the fee' do
           expect{card.deduct(1)}.to change{card.balance}.by(-1)
      end
   
#   it 'Can\'t deduct from £0' do
 
   end


end


