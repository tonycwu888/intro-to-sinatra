helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login
    # current_user
    session[:user_id] = @user.id
  end

  def logout
    session.destroy
  end

  def logged_in?
    current_user ? true : false
  end

end
