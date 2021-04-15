class UsersController < ApplicationController
	 #before_action :authorize_request, except: :create
 # before_action :find_user, except: %i[create index]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      #render json: @user, status: :created
      #render json: {
       # alert: "Signup Sucessfully"
      #}
      render json: {  user: @user.username , alert: "Signup Sucessfully"}, status: :created
    else
      render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
       #render json: {
        #alert: { errors: @user.errors.full_messages }
      #}
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { alert: "Deleted Sucessfully"}, status: :ok
  end

  private

  def find_user
    @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit( :name, :username, :email, :password)
    
  end
end
