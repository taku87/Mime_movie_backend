class Api::V1::UsersController < ApplicationController
  skip_before_action :authorize_request, only: [:create]

  def create
    register_user
    render json: current_user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def register_user
    authorization = Authorization::AuthorizationService.new(request.headers)
    user_name = user_params[:name]
    user_email = user_params[:email]
    @current_user = authorization.create_user(user_name, user_email)
  end
end
