class RoadTrip
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta,
              :route_error,
              :travel_hours

  def initialize(roadtrip_data)
    @start_city     = roadtrip_data[:start_city]
    @end_city       = roadtrip_data[:end_city]
    @travel_time    = format_time(roadtrip_data[:travel_time])
    @weather_at_eta = format_weather(roadtrip_data[:weather_at_eta])
    @route_error    = "Impossible Route"
    @travel_hours   = roadtrip_data[:travel_time].to_i

  end

  def format_time(time)
    if time.nil?
    formatted_time = 0
  else
    split_time = time.split(/:/)
    hour = split_time[0].to_i
    min = split_time[1].to_i
    "#{hour} hours, #{min} minutes"
  end
end


  def format_weather(weather)
    { temperature: weather[:temp],
      conditions: weather[:weather][0][:description]
    }
  end
end
