class RegistrationsController < ApplicationController
	def new
	
	end

	def create
		if required_user_params != ""
			@user = User.new(required_user_params)
			if @user.save
				redirect_to root_path
			end
		else
			flash[:notice] = "It failed, missing parameters"
			redirect_to sign_in_path
		end
	end

	def required_user_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
end
