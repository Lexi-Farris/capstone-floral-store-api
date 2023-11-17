class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  def current_user
     #in this controller so each controller can have access to this method
     #runs & looks for auth key & jwt token (bearer token). IF we find token, we save to 'token' variable, THEN proceed to decode the token so we have access to user ID that lives in JWT token.
     #id & expiry LIVE in the token. We then use the ID to retireve the user object from DB (that's what's returned when the 'user' is called from the DB)
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"]) # THIS is the user object, it's used to get the user ID from the current user that just logged in
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end
