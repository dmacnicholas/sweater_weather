class ForecastSerializer
     include JSONAPI::Serializer
     attributes :current_result, :daily_result, :hourly_result
end
