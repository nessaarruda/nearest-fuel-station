class SearchController < ApplicationController

  def index
    conn = Faraday.new('https://developer.nrel.gov')
    response = conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['FUEL_API_KEY']}&format=json&fuel_type=ELEC&location=80202")
    parsed = JSON.parse(response.body, symbolize_names: true)
    @station = parsed[:fuel_stations][0]
    @fuel_type = @station[:fuel_type_code]
    @name = @station[:station_name]
    @address = @station[:street_address]
    @access_times = @station[:access_days_time]
    @distance = @station[:distance].round(1)
    conn2 = Faraday.new('http://open.mapquestapi.com')
    response2 = conn2.get("/directions/v2/route?key=C001dcSUYX2coaBMlAb01XAk9UItVvCl&from=1331 17th St, Denver, CO&to=1800 Wazee Stree, Denver, CO")
    parsed2 = JSON.parse(response2.body, symbolize_names: true)
    route = parsed2[:route][:legs][0][:maneuvers][1]
    @directions = route[:narrative]
    @travel_time = route[:formattedTime]
  end
end
