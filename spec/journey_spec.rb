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

    it 'returns a penalty fare if no exit given' do
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an exit station' do
      let(:exit_station) { double :exit_station}

      before do
        subject.finish(exit_station)
      end

      it 'calculates a fare' do
        expect(subject.fare).to eq 1
      end

      it 'knows if a journey is complete' do
        expect(subject).to be_complete
      end

    end
  end


end
