# lib/json_web_token.rb
# frozen_string_literal: true
require 'net/http'
require 'uri'

class JsonWebToken
  # フロントから送られてきたaccessatokenを復号する作業
  def self.verify(token)
    JWT.decode(token, nil,
              true, # Verify the signature of this token
              algorithms: 'RS256', # 公開鍵/秘密鍵のペアを使用する暗号アルゴリズム
              iss: ENV['AUTH0_DOMAIN'], # JWT発行者(サーバー側)の識別子
              verify_iss: true,
              aud: ENV['AUTH0_IDENTIFIER'], #JWT を利用する主体(クライアント側)の識別子
              verify_aud: true) do |header|
      jwks_hash[header['kid']] # kidは署名に使用するキー（Public / Private Key）を識別する値
    end
  end

  # 復号に必要な公開鍵を取得する作業　auth0が保管している場所に取得しにいく。
  # これにより、署名検証が可能となる。
  def self.jwks_hash # jwks (JSON Web Key Set)
    jwks_raw = Net::HTTP.get URI("#{ENV['AUTH0_DOMAIN']}.well-known/jwks.json")
    jwks_keys = Array(JSON.parse(jwks_raw)['keys'])
    Hash[
      jwks_keys
      .map do |k|
        [
          k['kid'],
          OpenSSL::X509::Certificate.new(
            Base64.decode64(k['x5c'].first)
          ).public_key
        ]
      end
    ]
  end
end