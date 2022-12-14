class Api::V1::User::UsersController < SecuredController
  skip_before_action :authorize_request, only: [:create]

  def create
    register_user
    render json: current_user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def register_user
    authorization = AuthorizationService.new(request.headers)
    user_name = user_params[:name]
    @current_user = authorization.current_user(user_name)
  end
end
