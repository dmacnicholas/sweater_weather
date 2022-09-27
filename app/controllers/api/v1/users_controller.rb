class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)

    if params[:password] != params[:password_confirmation]
      render(json: { message: "Passwords do not match." }, status: :bad_request)
    elsif new_user.save
      render(json: UsersSerializer.new(new_user), status: :created)
    else
      render(json: { message: "E-mail alread exists." }, status: :bad_request)
    end
  end

  private

  def user_params
    params.permit(:email.downcase, :password, :password_confirmation)
  end
end
