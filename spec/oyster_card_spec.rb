require 'oyster_card'

describe OysterCard do
    subject(:oyster) { described_class.new }
    it 'initializes with a balance of 0' do
        expect(oyster.balance).to eq 0
    end

    describe "#top_up" do
    it 'adds money to balance' do
        expect { oyster.top_up(10) }.to change { oyster.balance }.by(10)
    end
    
        it 'raises an error if topping up over limit' do
            oyster.top_up(OysterCard::CARD_LIMIT)
            expect { oyster.top_up(1) }.to raise_error("Cannot top up over the £#{OysterCard::CARD_LIMIT} limit!")
        end
    end

    it 'deducts the fare from the balance' do
        oyster.top_up(OysterCard::CARD_LIMIT)
        expect { oyster.deduct(10) }.to change { oyster.balance }.by(-10)
    end

    describe "#in_journey?" do
        it 'returns false if not tapped in' do
            expect(oyster.in_journey?).to eq false
        end

        it 'returns true if tapped in' do
            oyster.state = true
            expect(oyster.in_journey?).to eq true
        end
    end

    describe "#touch_in" do
        it 'should change state to true' do
            oyster.top_up(OysterCard::MINIMUM_BALANCE)
            oyster.touch_in
            expect(oyster).to be_in_journey
        end

        it 'should raise an error if card does not hold the minimum balance' do
            expect { oyster.touch_in }.to raise_error("Insufficient funds for travel - £1 minimum required")
        end
    end

    describe "#touch_out" do
        it 'should change state to false' do
            oyster.top_up(OysterCard::MINIMUM_BALANCE)
            oyster.touch_in
            oyster.touch_out
            expect(oyster).not_to be_in_journey
        end
    end
end

