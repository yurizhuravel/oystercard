require 'journey'

describe Journey do

  subject(:journey) { Journey.new }
  let(:station) { double :station, zone: 1 }

  it 'knows when a journey is not complete' do
    expect(journey).not_to be_complete
  end

  it 'has a penalty fare by default' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it 'returns itself when finishing a journey' do
    expect(journey.finish(station)).to eq journey
  end

  context 'if there is an entry station' do
    subject { described_class.new(station)}

    it 'has an entry station' do
      expect(subject.entry_station).to eq station
    end
  end

end
