class ApplicationController < ActionController::Base
  protect_from_forgery

  # def after_sign_in_path_for(current_user)
  #   dashboard_url
  # end
  account_sid = 'AC14aa346613c89fec467663aad46c05a2'
  auth_token = '0e43d0a04e110f7faa2692e388b0c7f5'

  @client = Twilio::REST::Client.new account_sid, auth_token

end
