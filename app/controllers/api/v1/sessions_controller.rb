class Api::V1::SessionsController < ApplicationController

  before_action :authorize_user!, only: [:show]

  def show
    render json: {
      id: current_user.id,
      username: current_user.username,
      firstname: current_user.firstname,
      lastname: current_user.lastname,
      company: current_user.company,
      admin: current_user.admin,
      email: current_user.email
    }
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      render json: {
        id: user.id,
        username: user.username,
        firstname: user.firstname,
        lastname: user.lastname,
        company: user.company,
        admin: user.admin,
        email: user.email,
        jwt: JWT.encode({id: user.id}, "automotivePortalV1")
      }
    else
      render json: {
        error: "Please login with the correct credentials!"
      }, status: 404
    end
  end

end
