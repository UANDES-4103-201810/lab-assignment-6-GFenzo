class SessionsController < ApplicationController
	def new
	end

	def create
		email = params[:session][:email]
		pass = params[:session][:password]
		@user = User.where(email: email, password: pass).first
		if @user.nil?
			flash[:notice] = "Login failed, user email or password wrong."
			redirect_to root_path
		else
			flash[:notice] = "Login Success"
			session[:current_user_id] = @user.id
			redirect_to @user
		end

	end

	def destroy
		session[:current_user_id] = nil
		redirect_to root_path
	end
end
