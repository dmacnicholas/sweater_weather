class Api::V1::BookSearchController < ApplicationController

  def index
       if params[:quantity].to_i < 1
           render status: :bad_request
       else
           location = LocationFacade.create_location(params[:location])

           forecast = WeatherFacade.create_forecast(location.latitude, location.longitude)

           books = BookFacade.get_the_books(params[:location], params[:quantity])

           render json: BookSerializer.book_search(params[:location], forecast, books)
       end
   end
end
