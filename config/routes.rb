Rails.application.routes.draw do
  get '/', to:'home#index'

	resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  
end
