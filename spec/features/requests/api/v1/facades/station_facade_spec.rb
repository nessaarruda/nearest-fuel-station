require 'rails_helper'

describe StationFacade do
  describe 'happy path' do
    it 'fetch station data and build poros from data' do

      result = StationFacade.get_a_station
  
      expect(result.access_times).to eq("MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified")
      expect(result.address).to eq('1800 Wazee Street')
      expect(result.distance).to eq(0.1)

    end
  end
end
