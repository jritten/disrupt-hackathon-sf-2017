# volunteers login form
get '/volunteers/login' do
  erb :'volunteers/login'
end

# login volunteer
post '/volunteers' do
  @volunteer = Volunteer.find_by(email: params[:email])

  if @volunteer && @volunteer.authenticate(params[:password])
    login_volunteer(@volunteer)
    redirect '/'
  else
    @errors = ["PLEASE TRY AGAIN"]
    erb :'volunteers/login'
  end
end

# logout volunteer
delete '/volunteers' do
  logout_volunteer
  redirect '/'
end
