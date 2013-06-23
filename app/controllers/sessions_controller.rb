class SessionsController < ApplicationController
  
  # Redirects to the login page so the user can log in and make
  # a new session
  def new

  end

  # Creates a new session by authenticating the user and creating
  # a session variable.
  def create
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => 'Logged in!'
    else
      flash.now.alert = 'Invalid username or password'
      render 'new'
    end
  end

end
