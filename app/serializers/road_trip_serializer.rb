class RoadTripSerializer
  def self.get_roadtrip(roadtrip)
    {
      data: {
        id: nil,
        type: "roadtrip",
        attributes: {
          start_city: "#{roadtrip.start_city}",
          end_city: "#{roadtrip.end_city}",
          travel_time: "#{roadtrip.travel_time}",
          weather_at_eta: {
            temperature: roadtrip.weather_at_eta[:temperature],
            conditions: roadtrip.weather_at_eta[:conditions]
          }
        }
      }
    }
  end
end
