require 'journey_log'
require 'journey'

describe JourneyLog do

  let(:station) {double :station}
  let(:journey) {double :journey}
  let(:journey_class) {double :journey_class, new: journey}
  subject {described_class.new(journey_class: journey_class)}

  describe '#start' do
    it 'should start a new journey with an entry station' do
      expect(journey_class).to receive(:new).with(entry_station: station)
      subject.start(station)
    end

    it 'records a journey' do
      allow(journey_class).to receive(:new).and_return journey
      subject.start(station)
      expect(subject.journey_history).to include journey
    end
  end

 describe '#finish' do
   it 'should finish a journey with an exit station' do
     allow(journey_class).to receive(:new).and_return journey
     allow(journey).to receive(:finish).and_return journey
     subject.start(station)
     subject.finish(station)
     expect(subject.current_journey.exit_station).to eq station

   end
 end
end
