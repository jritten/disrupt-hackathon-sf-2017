get '/volunteers/:id/gigs' do 
  @volunteer = Volunteer.find(params[:id])
  @gigs = @volunteer.gigs

  erb :'volunteers/show'
end

# new gig form
get '/volunteers/:id/gigs/new' do 
  @volunteer = Volunteer.find(params[:id])
  @gig = @volunteer.Gig.new 

  erb :'gig/new'
end

# create new gig 
post '/volunteers/:id/gigs' do 
  @volunteer = Volunteer.find(params[:id])
  @gig = @volunteer.Gig.new(params[:gig])
  @parent = @gig.parent

  if @gig.save
    erb :'gigs/index'
  else
    @errors = @gig.errors.full_messages
    erb :'volunteers/:id/gigs/new'
  end
end

get '/volunteers/:id/parents/:parent_id/gigs/index' do 
  @volunteer = Volunteer.find(params[:id])
  # @gig = @volunteer.Gig.new(params[:gig])
  # @parent = @gig.parent
  @parent = Parent.find(params[:parent_id])

  erb :'gigs/index'
end

# http://localhost:9393/volunteers/1/parents/1/gigs/index