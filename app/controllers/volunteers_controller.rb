# volunteers registration form
get '/volunteers/new' do 
  erb :'volunteers/new'
end

# register new volunteer
get '/volunteers' do 
  @volunteer = Volunteer.new(params[:volunteer])

  if @volunteer.save
    login(@volunteer)
    redirect "/volunteers/#{@volunteer.id}"
  else
    @errors = @volunteer.errors.full_messages
    erb :'volunteers/new'
  end
end

# volunteer profile
get '/volunteers/:id' do 
  @volunteer = Volunteer.find(params[:id])
  @gigs = @volunteer.gigs
  @kids = @gigs.parents
  @parents = @kids.parents

  erb :'volunteers/show'
end