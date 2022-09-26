# class CurrentForecast
#   def self.data(attributes)
#     {
#       datetime: Time.at(attributes[:dt]),
#       sunrise: Time.at(attributes[:sunrise]),
#       sunset: Time.at(attributes[:sunset]),
#       temperature: attributes[:temp],
#       feels_like: attributes[:feels_like],
#       humidity: attributes[:humidity],
#       uvi: attributes[:uvi],
#       visibility: attributes[:visibility],
#       conditions: attributes[:weather].first[:description],
#       icon: attributes[:weather].first[:icon]
#     }
#   end
# end
