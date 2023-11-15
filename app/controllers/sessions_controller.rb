class SessionsController < ApplicationController

  #logs user in. just looking for email & pw to create JWT token
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password]) #if user is found AND password is correct:
      jwt = JWT.encode( #user is encrypted and JWT token is created & passed
        {
          user_id: user.id, # the data to encode
          exp: 24.hours.from_now.to_i # the expiration time
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      render json: { jwt: jwt, email: user.email, user_id: user.id }, status: :created
    else
      render json: {}, status: :unauthorized #if user isn't found, token not give,, lo gin invalid 
    end
  end
end
