# volunteers login form
get '/volunteers/login' do
  erb :'volunteers/login'
end

# login volunteer
post '/volunteers/login' do
  @volunteer = Volunteer.find_by(email: params[:email])

  if @volunteer && @volunteer.authenticate(params[:password])
    login_volunteer(@volunteer)
    redirect '/'
  else
    @errors = ["PLEASE TRY AGAIN"]
    erb :'volunteers/login'
  end
end

# volunteer profile
get '/volunteers/:id' do
  @volunteer = Volunteer.find(params[:id])
  # @gigs = @volunteer.gigs
  # @kids = @gigs.parents
  # @parents = @kids.parents

  erb :'volunteers/show'
end

# logout volunteer
delete '/volunteers/logout' do
  logout_volunteer
  redirect '/'
end
