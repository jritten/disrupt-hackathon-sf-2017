require 'nexmo'
nexmo = Nexmo::Client.new(
  key: '0b5dd1d6',
  secret: '0dc8edacb2e29e0b'
)

# parents registration form
get '/parents/new' do
  erb :'parents/new'
end

# register new parent
post '/parents' do
  @parent = Parent.new(params[:parent])

  # start verification request
  response = nexmo.start_verification(
    number: params['phone'],
    brand: 'SitTech'
  )

  if @parent.save && response['status'] == '0'
    session[:verification_id] = response['request_id']
    login_parent(@parent)
    # redirect "/parents#{@parent.id}"
    redirect '/verify'
  else
    @errors = ["Please try again"]
    erb :'parents/new'
  end
end

# verification form
get '/verify' do 
  erb :'verify'
end


post '/verify' do 
 # check the code with Nexmo
  response = nexmo.check_verification(
    session[:verification_id],
    code: params[:code]
  )

  # any status that's not '0' is an error
  if response['status'] == '0'
    # set the current user to the number
    session[:user] = session[:number]

    redirect '/'
  else
    @errors = ["Phone Verification Failed"]
    redirect '/login'
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
