class ForecastSerializer
#      include JSONAPI::Serializer
#      attributes :current_result, :daily_result, :hourly_result
# end
def self.forecast_poro(forecast)
   { "data":
     {
       "id": nil,
       "type": "forecast",
       "attributes":
       {
         "current_weather": {
           "datetime": forecast.datetime,
           "sunrise": forecast.sunrise,
           "sunset": forecast.sunset,
           "temperature": forecast.temp,
           "feelsLike": forecast.feels_like,
           "humidity": forecast.humidity,
           "uvi": forecast.uvi,
           "visibility": forecast.visibility,
           "conditions": forecast.conditions,
           "icon": forecast.icon
         },
         "daily_weather":  forecast.daily.shift(5).map do |day|
           {
             "datetime": day.datetime,
             "sunrise": day.sunrise,
             "sunset": day.sunset,
             "max_temp": day.max_temp,
             "min_temp": day.min_temp,
             "conditions": day.conditions,
             "icon": day.icon
           }
         end,
         "hourly_weather":  forecast.hourly.shift(8).map do |hour|
           {
             "time": hour.time,
             "temp": hour.temp,
             "conditions": hour.conditions,
             "icon": hour.icon
           }
         end,
       }
     }
   }


 end


end
