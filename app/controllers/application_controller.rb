class ApplicationController < ActionController::Base
  protect_from_forgery

  # def after_sign_in_path_for(current_user)
  #   dashboard_url
  # end
  account_sid = ENV['account_sid']
  auth_token = ENV['auth_token']
  @client = Twilio::REST::Client.new account_sid, auth_token

end
