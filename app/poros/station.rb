class Station
  attr_reader :name,
              :address,
              :access_times,
              :distance,
              :fuel_type
  def initialize(data)
    @name = data[:station_name]
    @address = data[:street_address]
    @access_times = data[:access_days_time]
    @distance = data[:distance].round(1)
    @fuel_type = data[:fuel_type_code]
  end
end
