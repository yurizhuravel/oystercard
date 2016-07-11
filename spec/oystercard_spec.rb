require 'oystercard'

describe Oystercard do
    
    it 'tells your balance is 0' do
        expect(subject.balance).to eq 0
    end
describe '#top_up' do
   it 'tells you when you top up' do 
       expect(subject.top_up(1)).to eq 1
      end
   end
 
    
end


