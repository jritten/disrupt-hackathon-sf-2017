get '/parents/:id/gigs' do 
  @parent = Parent.find(params[:id])
  @gigs = @parent.gigs

  erb :'parents/show'
end

# new gig form
get '/parents/:id/gigs/new' do 
  @parent = Parent.find(params[:id])
  @gig = @parent.Gig.new 

  erb :'gig/new'
end

# create new gig 
post '/parents/:id/gigs' do 
  @parent = Parent.find(params[:id])
  @gig = @parent.Gig.new(params[:gig])
  @volunteer = @gig.volunteer

  if @gig.save
    erb :'gigs/index'
  else
    @errors = @gig.errors.full_messages
    erb :'parents/:id/gigs/new'
  end
end