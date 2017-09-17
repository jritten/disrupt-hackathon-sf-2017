require 'nexmo'
nexmo = Nexmo::Client.new(
  key: '0b5dd1d6',
  secret: '0dc8edacb2e29e0b'
)

helpers do 
  def start_parent_verification
  # start verification request
  @response = nexmo.start_verification(
    number: params['parent']['phone'],
    brand: 'SitTech')
  end

  def start_volunteer_verification
  # start verification request
  @response = nexmo.start_verification(
    number: params['volunteer']['phone'],
    brand: 'MyApp')
  end

  def verify_response?
    # any status that's not '0' is an error
    response['status'] == '0'
  end

  def verify_user
    # set the current user to the number
    session[:verification_id] = response['request_id']
  end

  def check_verification
  # check the code with Nexmo
  response = nexmo.check_verification(
    session[:verification_id],
    code: params[:code])
  end

  def set_current_user
    # set the current user to the number
    session[:user] = session[:number]
  end
end