# this should be the parents finding volunteers and posting their kids videos

get '/volunteers/:id/gigs/new' do
  erb :'gigs/new'
end

get '/volunteers/:id/gigs/show' do
  @volunteer = Volunteer.find(params[:id])
  @id = params[:id]
  @session = tokcreate_session(@id)
  # @gigs.update_attributes session_id: tok_session.session_id

  redirect "/#{@volunteer.session_id}"
end

get "/:session_id" do
  @volunteer = Volunteer.find_by(session_id: params[:session_id])
  session_id = params[:session_id]
  @token = tokgenerate_token(@volunteer.id)
  # token = session_id.generate_token :role => :publisher
erb :'/gigs/show'
end