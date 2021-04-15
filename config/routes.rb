Rails.application.routes.draw do
  get '/', to:'home#index'

	resources :users
	resources :books do
		collection do
	   		get '/user_books', to:'users#user_books' 
	  end
	end
  #post '/auth/login', to: 'authentication#login'
  post '/login', to: 'sessions#create'
  
  post '/forgot_password', to:'passwords#forgot'
	post '/reset_password', to:'passwords#reset'


end
