class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      # https://en.wikipedia.org/wiki/JSON_Web_Token
      payload = {
        iss: "api-auth",
        sub: @user.id.to_s,
        exp: 2.seconds.from_now.to_i,
        iat: Time.current.to_i,
        jti: SecureRandom.uuid
      }

      token = JWT.encode(
        payload,
        Rails.application.credentials.secret_key_base,
        "HS256"
      )

      render json: {
        token: token,
        user: {
          email: @user.email
        }
      }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params.expect(:id))
  end

  def user_params
    params.expect(user: [:email, :password])
  end
end
