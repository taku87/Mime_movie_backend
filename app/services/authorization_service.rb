class AuthorizationService
  def initialize(headers = {})
    @headers = headers
  end

  def current_user
    @auth_payload, @auth_header = verify_token
    @user = User.from_token_payload(@auth_payload)
  end

  private
  # ヘッダーに付与されてきたaccesstokenを取り出す作業
  def http_token
    @headers['Authorization'].split(' ').last if @headers['Authorization'].present?
  end
  # accesstokenを検証する作業
  def verify_token
    JsonWebToken.verify(http_token)
  end
end