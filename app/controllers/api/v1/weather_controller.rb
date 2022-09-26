class Api::V1::WeatherController < ApplicationController
   def index
       location = LocationFacade.create_location(params[:location])

       forecast = WeatherFacade.create_forecast(location.latitude, location.longitude)

       render json: ForecastSerializer.forecast_poro(forecast)
   end
end
