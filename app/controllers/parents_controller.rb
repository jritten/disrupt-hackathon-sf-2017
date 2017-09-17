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

  response = nexmo.start_verification(
    number: params['parent']['phone'],
    brand: 'MyApp')
  # start_parent_verification

  if @parent.save && response['status'] == '0'
  # if @parent.save && verify_response?
    session[:verification_id] = response['request_id']
    # verify_user
    login_parent(@parent)
    redirect '/verify'
  else
    @errors = ["PLEASE TRY AGAIN"]
    erb :'parents/new'
  end
end

# verification form
get '/verify' do 
  erb :'verify'
end

# verify code
post '/verify' do 
  response = nexmo.check_verification(
    session[:verification_id],
    code: params[:code])
  # check_verification

  if response['status'] == '0'
  # if verify_response?
    session[:user] = session[:number]
    # set_current_user
    # redirect "/parents#{@parent.id}"
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
