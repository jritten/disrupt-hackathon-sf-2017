require 'nexmo'
nexmo = Nexmo::Client.new(
  key: '0b5dd1d6',
  secret: '0dc8edacb2e29e0b'
)

# volunteers registration form
get '/volunteers/new' do
  erb :'volunteers/new'
end

# register new volunteer
post '/volunteers' do
  @volunteer = Volunteer.new(params[:volunteer])

  p params

  response = nexmo.start_verification(
    number: params['volunteer']['phone'],
    brand: 'MyApp')
  # start_volunteer_verifications

  p response
  
  if @volunteer.save && response['status'] == '0' 
  # if @volunteer.save && verify_response?
    session[:verification_id] = response['request_id']
    # verify_user
    login_volunteer(@volunteer)
    redirect "/verify"
  else
    @errors = ["PLEASE TRY AGAIN"]
    erb :'volunteers/new'
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
  check_verification

  if response['status'] == '0'
  # if verify_response?
    session[:user] = session[:number]
    # set_current_user
    # redirect "/volunteers/#{@volunteer.id}"
    redirect '/'
  else
    @errors = ["Phone Verification Failed"]
    redirect '/login'
  end
end

