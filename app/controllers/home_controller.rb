class HomeController < ApplicationController
	 def index
	 	render json: {
        message: 'Welcome to API'
      }
	 end
end