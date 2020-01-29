require 'stations'
describe Stations do

  subject(:station) { described_class.new }

  it 'station name' do
    station = Stations.new("Stratford", 1)
    expect(station.name).to eq("Stratford")
  end

  it 'station zone' do
    station = Stations.new("Stratford", 1)
    expect(station.zone).to eq(1)
  end

end