class SessionsController < ApplicationController
 
  def create
   @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      login!
      render json: {  data: @user.username , alert: "Login Sucessfully"}, status: :ok
    else
      render json: { error: 'Sorry ! Your username or password incorrect.' }, status: :unauthorized
    end
  end
  def is_logged_in?
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no such user'
      }
    end
  end
  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end
  private
    def session_params
      params.permit(:email, :password)
    end
end