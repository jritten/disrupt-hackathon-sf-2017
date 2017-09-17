# volunteers login form
get '/parents/login' do
  erb :'parents/login'
end

# login volunteer
post '/parents/login' do
  @parent = Parent.find_by(email: params[:email])

  if @parent && @parent.authenticate(params[:password])
    login_parent(@parent)
    redirect '/'
  else
    @errors = ["PLEASE TRY AGAIN"]
    erb :'parents/login'
  end
end

# logout volunteer
delete '/parents/logout' do
  logout_parent
  redirect '/'
end
