# parents registration form
get '/parents/new' do
  erb :'parents/new'
end

# register new parent
post '/parents' do
  @parent = Parent.new(params[:parent])

  if @parent.save
    # VERIFY PHONE MESSAGE
    login_parent(@parent)
    # redirect "/parents#{@parent.id}"
    redirect "/"
  else
    ["PLEASE TRY AGAIN"]
    erb :'parents/new'
  end
end

# # parent profile
# get '/parents/:id' do
#   @parent = Parent.find(params[:id])
#   @kids = @parent.kids
#   @gigs = @kids.gigs
#   @volunteers = @gigs.volunteers
#
#   erb :'parents/show'
# end
