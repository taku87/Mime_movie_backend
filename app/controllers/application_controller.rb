class ApplicationController < ActionController::Base
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  include Pundit

  protect_from_forgery with: :exception

  def set_csrf_token
    cookies['CSRF-TOKEN'] = {
      domain: 'mime-movie.com', # 親ドメイン
      value: form_authenticity_token
    }
  end
end
