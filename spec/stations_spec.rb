require 'stations'
describe Stations do

  let(:station) { Stations.new("Stratford", 1) }

  it 'station name' do
    expect(station.name).to eq("Stratford")
  end

  it 'station zone' do
    expect(station.zone).to eq(1)
  end

end