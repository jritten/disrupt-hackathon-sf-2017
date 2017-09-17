# volunteers login form
get '/volunteers/login'
  erb :'volunteers/login'
end

# login volunteer
@volunteer = Volunteer.find_by(email: params[:email])

  if @volunteer
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