class SessionsController < ApplicationController
  def new
  end

  # POST /login
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Success
      session[:user_id] = user.id
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user
    else
      # Failure
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def twitter_create
      user = request.env['omniauth.auth']
      session[:user_id] = user[:info][:nickname]
      flash[:success] = "#{session[:user_id]}! Welcome to the Sample App!"
      redirect_to root_path
  end

  # DELETE /logout
  def destroy
    log_out if current_user
    redirect_to root_url
  end
end
