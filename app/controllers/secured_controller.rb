class SecuredController < ApplicationController
  before_action :authorize_request, except: [:show]

  def show
    set_csrf_token
    render json: {}, status: :ok
  end

  private

  def authorize_request
    authorize_request = AuthorizationService.new(request.headers)
    @current_user = authorize_request.current_user
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  attr_reader :current_user

end