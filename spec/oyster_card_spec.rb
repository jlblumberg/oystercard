require 'oyster_card'

describe OysterCard do
    subject(:oyster) { described_class.new }
    it 'initializes with a balance of 0' do
        expect(oyster.balance).to eq 0
    end

    it 'adds money to balance' do
        expect { oyster.top_up(10) }.to change { oyster.balance }.from(0).to(10)
    end
end

