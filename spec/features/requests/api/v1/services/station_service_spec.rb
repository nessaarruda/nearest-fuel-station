require 'rails_helper'

describe StationService do
  describe 'happy path' do
    it 'fetch station data and build poros from data' do

      result = StationService.station_data

      expect(result).to be_an(Hash)
      expect(result[:station_name]).to eq('Dairy Block Parking Garage')
      expect(result[:street_address]).to eq('1800 Wazee Street')
      expect(result[:distance].round(1)).to eq(0.1)

    end
  end
end
