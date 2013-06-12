class Text < ActiveRecord::Base
  # attr_accessible :title, :body
  def set_client_api

    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    return @account = @client.account
  end

  def self.out_of_range_text_response to, body
    @account = Text.new.set_client_api
    @account.sms.messages.create(:from => '+13473217539', :to => to, :body =>body)
    # @account.sms.messages.create(:from => '+13473217539', :to => to, :body =>body)
  end 

end
