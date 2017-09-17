helpers do
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def access_allowed?(restaurant)
    logged_in? && current_user.id == restaurant.user_id
  end
end