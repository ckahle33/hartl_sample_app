class SessionsController < ApplicationController
  def new
  	# renders the template
  end

  def create 
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])
  		log_in @user
  		params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
  		redirect_to @user
  	else
  		#show an error message
  		flash.now[:danger] = 'Invalid email/password combination' #not quite!
  		render 'new'
  	end
  end

  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  end
end
