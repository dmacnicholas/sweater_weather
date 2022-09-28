class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user.nil?
      render(json: { message: "User is unauthorized." }, status: :unauthorized)
    else
      roadtrip = RoadTripFacade.create_roadtrip(params[:origin], params[:destination])
      

      render(json: RoadTripSerializer.get_roadtrip(roadtrip))
    end
  end
end
