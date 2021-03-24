Rails.application.routes.draw do
	 root 'home#index'

	resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  
end
