helpers do
  def current_volunteer
    @current_volunteer ||= Volunteer.find(session[:volunteer_id]) if session[:volunteer_id]
  end

  def volunteer_logged_in?
    !!current_volunteer
  end

  def login_volunteer(volunteer)
    session[:volunteer_id] = volunteer.id
  end

  def logout_volunteer
    session[:volunteer_id] = nil
  end
end