class SessionsController < ApplicationController

  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])

      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private

  def authenticate_with_credentials(email, password)
    # If the user exists AND the password entered is correct.
    user = User.find_by_email(email)
    if user && user.authenticate(password)
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
    else
      nil
    end
  end
end
