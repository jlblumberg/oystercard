require 'journey'

describe Journey do
  subject(:journey) { described_class.new(entry_station = "station")}

  it "is created with an entry station" do
    expect(journey.entry_station).to eq("station")
  end

  it "knows if a journey is not complete" do
    expect(journey.complete?).to eq(false)
  end

  describe "#fare" do
    let(:station) { double :station, zone: 1}
    let(:other_station) { double :other_station }

    it 'has a penalty fare by default' do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "returns itself when exiting a journey" do
      expect(journey.exit(station)).to eq(journey)
    end

    context "given an entry station" do
      # maybe another subject statement?

      it "returns a penalty fare if not given an exit station" do
        journey.exit
        expect(journey.fare).to eq(Journey::PENALTY_FARE)
      end

      it "completes journey if someone exits without giving station" do
        journey.exit
        expect(journey.complete?).to eq(true)
      end

      context "given an exit station" do
        before do
          journey.exit(other_station)
        end

        it "knows if a journey is complete" do
          expect(journey.complete?).to eq(true)
        end
      end # end context
    end # end context
  end # end describe
end # end describe