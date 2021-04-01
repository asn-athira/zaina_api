class AuthenticationController < ApplicationController
	before_action :authorize_request, except: :login
    require 'json'

  # POST /auth/login
  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      
      #token = JsonWebToken.encode(user_id: @user.id)
      #time = Time.now + 24.hours.to_i
      #render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                  # username: @user.username }, status: :ok
      #render json: {
        #alert: "Login Sucessfully"
      #}                  
       render json: {  user: @user.username , alert: "Login Sucessfully"}, status: :ok
    else
      render json: { error: 'Sorry ! Your username or password incorrect.' }, status: :unauthorized
      #render json: {
        #alert: "Sorry ! Your username or password incorrect."
      #}
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
