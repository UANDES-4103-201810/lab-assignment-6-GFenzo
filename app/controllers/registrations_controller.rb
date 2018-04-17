class RegistrationsController < ApplicationController
	def new
	
	end

	def create
			@user = User.new(required_user_params)
			if @user.save
				flash[:notice] = "It worked!, user registered"
				redirect_to root_path
			else
			flash[:notice] = "It failed, missing parameters"
			redirect_to sign_in_path
			end
	end

	def required_user_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
