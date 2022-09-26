class Api::V1::BookController < ApplicationController

  def index
    location = params[:location]
    quantity = params[:quantity]

    books = BookFacade.get_the_books(location, quantity)

    forecast = BookForecastFacade.get_forecast(location)

    render json: BookSerializer.search_for_books(books, forecast, location)
  end

end
