get '/parents/:id/kids' do
  @parent = Parent.find(params[:id])
  @kids = @parent.kids

  erb :'kids/index'
end

# new kid form
get '/parents/:id/kids/new' do
  @parent = Parent.find(params[:id])
  @kid = @parent.Kid.new

  erb :'kids/new'
end

# create new kid
post '/parents/:id/kids' do
  @parent = Parent.find(params[:id])
  @kid = @parent.Kid.new(params[:kid])

  if @kid.save
    erb :'parents/:id'
  else
    @errors = @kid.errors.full_messages
    erb :'parents/:id/kids/new'
  end
end
