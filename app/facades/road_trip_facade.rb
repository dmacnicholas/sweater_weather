class RoadTripFacade
  def self.create_roadtrip(origin, destination)
    travel_time = LocationService.directions_search(origin, destination)
    destination_coor = LocationFacade.create_location(destination)

    destination_weather = WeatherService.weather_search(destination_coor.latitude, destination_coor.longitude)
    travel_hours = travel_time[:route][:formattedTime].split(/:/)[0].to_i

    arrival_temp = destination_weather[:hourly][travel_hours]

    roadtrip = {
      start_city: origin,
      end_city: destination,
      travel_time: travel_time[:route][:formattedTime],
      weather_at_eta: arrival_temp
    }

    RoadTrip.new(roadtrip)
  end
end
