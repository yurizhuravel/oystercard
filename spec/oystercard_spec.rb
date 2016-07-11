require 'oystercard'

describe Oystercard do
  #subject(:card) {Oystercard.new (:money)}

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  #it 'tops up card with money' do
  #  expect{card.top_up(money)}.to eq money
#  end

end
