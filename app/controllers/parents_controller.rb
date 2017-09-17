# parents registration form
get '/parents/new' do 
  erb :'parents/new'
end

# register new parent
post '/parents' do 
  @parent = Parent.new(params[:parent])

  if @parent.save
    # VERIFY PHONE MESSAGE
    login(@parent)
    redirect "/parents#{@parent.id}"
  else
    @errors = errors.full_messages
    erb :'parents/new'
  end
end

# parent profile
get '/parents/:id' do 
  @parent = Parent.find(params[:id])
  @kids = @parent.kids
  @gigs = @kids.gigs
  @volunteers = @gigs.volunteers

  erb :'parents/show'
end