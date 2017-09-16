# user login form
get '/sessions/new' do
  erb :'sessions/new'
end

# login user
post '/sessions' do
  @user = User.find_by(email: params[:email])

  if @user
    if @user && @user.authenticate(params[:password])
      login(@user)
      redirect '/'
    else
      @errors = ["PLEASE TRY AGAIN"]
      erb :'sessions/new'
    end
  else
    erb :'users/new'
  end
end

# logout user
delete '/sessions' do
  logout
  redirect '/'
end