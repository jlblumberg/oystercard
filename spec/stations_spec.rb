require 'stations'
describe Stations do
    subject(:station) { described_class.new }
    it 'has an instance variable for name' do
        expect(station.name).to eq "name"
    end

    it 'has an instance variable for zone' do
        expect(station.zone).to eq "zone"
    end
end