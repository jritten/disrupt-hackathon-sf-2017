helpers do
  def current_parent
    @current_parent ||= Parent.find(session[:parent_id]) if session[:parent_id]
  end

  def parent_logged_in?
    !!current_parent
  end

  def login_parent(parent)
    session[:parent_id] = parent.id
  end

  def logout_parent
    session[:parent_id] = nil
  end
end