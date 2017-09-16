# registration form
get '/users/new' do
  erb :'users/new'
end

# register new user
post '/users' do
  @user = User.new(params[:user])

  if @user.save
    login(@user)
    # redirect "/users/#{@user.id}"
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end

# user profile
# get '/users/:id' do
#   @user = User.find(params[:id])
#   @restaurants = @user.restaurants
#   @reviews = @restaurants.reviews
#   erb :'users/show'
# end