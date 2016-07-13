require 'station.rb'

describe Station do

    before(:each)do
        @station = Station.new('Richmond', 4)
    end
    it 'knows its name' do
        expect(@station.name).to eq("Richmond")
    end
    
    it 'knows its zone' do
        expect(@station.zone).to eq(4)
    end
    
 end
