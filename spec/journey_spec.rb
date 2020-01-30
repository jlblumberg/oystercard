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
    
  end 
end