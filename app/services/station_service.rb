class StationService

  def self.station_data
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['FUEL_API_KEY']}&format=json&fuel_type=ELEC&location=80202")
    parsed(response)[:fuel_stations][0]
  end

  private

    def self.conn
      conn = Faraday.new('https://developer.nrel.gov')
    end

    def self.parsed(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
