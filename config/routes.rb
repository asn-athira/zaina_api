Rails.application.routes.draw do
  get '/', to:'home#index'

	resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'

  post '/forgot_password', to:'passwords#forgot'
	post '/reset_password', to:'passwords#reset'
  
end
