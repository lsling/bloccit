class SessionsController < ApplicationController
  def new
  end

  def create
 # # we search the database for a user with the specified email address in the  params hash
    user = User.find_by(email: params[:session][:email].downcase)

 # # we verify that user is not nil and that the password in the params hash matches the specified password
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
 # # we define destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
