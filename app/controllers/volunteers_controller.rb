# volunteers registration form
get '/volunteers/new' do
  erb :'volunteers/new'
end

# register new volunteer
get '/volunteers' do
  @volunteer = Volunteer.new(params[:volunteer])

  if @volunteer.save
    #VERIFY PHONE MESSAGE
    login_volunteer(@volunteer)
    # redirect "/volunteers/#{@volunteer.id}"
    redirect "/"
  else
    @errors = ["PLEASE TRY AGAIN"]
    erb :'volunteers/new'
  end
end

# volunteer profile
# get '/volunteers/:id' do
#   @volunteer = Volunteer.find(params[:id])
#   @gigs = @volunteer.gigs
#   @kids = @gigs.parents
#   @parents = @kids.parents
#
#   erb :'volunteers/show'
# end
