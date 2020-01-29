require 'oyster_card'

describe OysterCard do
    subject(:oyster) { described_class.new }
    let(:station) { double('bank') }
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

    describe "#in_journey?" do
        it 'returns false if not tapped in' do
            expect(oyster.in_journey?).to eq nil
        end

        it 'returns true if tapped in' do
            oyster.top_up(OysterCard::CARD_LIMIT)
            oyster.touch_in(station)
            expect(oyster.in_journey?).to eq (station)
        end
    end

    describe "#touch_in" do
        it 'should change state to true' do
            oyster.top_up(OysterCard::MINIMUM_FARE)
            oyster.touch_in(station)
            expect(oyster).to be_in_journey
        end

        it 'should raise an error if card does not hold the minimum balance' do
            expect { oyster.touch_in(station) }.to raise_error("Insufficient funds for travel - £1 minimum required")
        end

        it 'should accept an entry station' do
            expect(oyster).to respond_to(:touch_in).with(1).argument
        end
    end

    describe "#touch_out" do
        before (:each) do
            oyster.top_up(OysterCard::MINIMUM_FARE)
            oyster.touch_in(station)
        end
        it 'should change state to false' do
            oyster.touch_out
            expect(oyster).not_to be_in_journey
        end

        it 'should deduct the minimum fare from the balance' do
            expect { oyster.touch_out }.to change{ oyster.balance }.by(-OysterCard::MINIMUM_FARE)
        end

        it 'should forget the entry station once touched out' do
            expect { oyster.touch_out }.to change{ oyster.entry_station }.to nil
        end
    end
end

