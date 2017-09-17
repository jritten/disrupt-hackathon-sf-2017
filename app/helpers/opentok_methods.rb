def tokgenerate_token(room)
  @room = room
  @volunteer = Volunteer.find(room)
  @opentok = OpenTok::OpenTok.new ENV["APIKEY"], ENV["SECRET"]
    tokcreate_session unless @volunteer.session_id.present?
  role = :publisher
  @opentok.generate_token @volunteer.session_id, {role: role}
end

  def tokcreate_session(room)
    @room = room
    @volunteer = Volunteer.find(@room)
    @opentok = OpenTok::OpenTok.new ENV["APIKEY"], ENV["SECRET"]
    tok_session = @opentok.create_session
    # save session_id on DB, Session never expires
    @volunteer.update_attributes session_id: tok_session.session_id
  end