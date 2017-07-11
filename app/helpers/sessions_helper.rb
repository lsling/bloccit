module SessionsHelper
  # # we define create_session. create_session sets user_id on the session object to user.id, which is unique for each user
  def create_session(user)
    session[:user_id] = user.id
  end

# # we define destroy_session
  def destroy_session(user)
    session[:user_id] = nil
  end

# # we define current_user, which returns the current user of the application.  current_user encapsulates the pattern of finding the current user that we would otherwise call throughout Bloccit
  def current_user
    User.find_by(id: session[:user_id])
  end
end
