require 'oystercard'

describe Oystercard do
    
    it 'tells your balance is 0' do
        expect(subject.balance).to eq 0
    end
    
end