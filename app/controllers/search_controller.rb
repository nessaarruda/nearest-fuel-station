class SearchController < ApplicationController

  def index
    @station = StationFacade.get_a_station
    conn2 = Faraday.new('http://open.mapquestapi.com')
    response2 = conn2.get("/directions/v2/route?key={key}from=1331 17th St, Denver, CO&to=1800 Wazee Stree, Denver, CO")
    parsed2 = JSON.parse(response2.body, symbolize_names: true)
    route = parsed2[:route][:legs][0][:maneuvers][1]
    @directions = route[:narrative]
    @travel_time = route[:formattedTime]
  end
end
