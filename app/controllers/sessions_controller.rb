class SessionsController < ApplicationController

	def new
	end
	
	def create
		#render 'new'
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			#Sign in and redirect to user's show page
			sign_in user
			#redirect_to user
			redirect_back_or user
		else
			#Create error message and re-render signin form
			flash.now[:error] = 'Invalid email/password combination' #wrong
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end
	
end
