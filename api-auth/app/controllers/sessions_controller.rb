class SessionsController < ApplicationController
  def create
    debugger
    decoded = JWT.decode(
      token,
      Rails.application.credentials.secret_key_base,
      {algorithm: "HS256"}
    )
  rescue JWT::ExpiredSignature
    # Handle expired token, e.g. logout user or deny access
  end

  def token
    token_and_options(request)[0]
  end

  def session_params
    params.expect(session: [:user_agent, :ip_address, :request_id, :user_id])
  end
end
