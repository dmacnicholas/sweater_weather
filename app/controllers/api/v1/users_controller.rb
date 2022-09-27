class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)

    if params[:password] != params[:password_confirmation]
      render(json: { message: "Passwords do not match" }, status: :unprocessable_entity)
    elsif new_user.save
      render(json: UsersSerializer.response_body(new_user), status: :created)
    else
      render(json: { message: "Email has already been taken" }, status: :unprocessable_entity)
    end
  end

  private

  def user_params
    params.permit(:email.downcase, :password, :password_confirmation)
  end
end
