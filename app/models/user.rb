class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def self.retrieve_twilio_user(account_sid, auth_token)
    @client = Twilio::Twilio::REST::Client.new account_sid, auth_token
    return client
  end

  def self.retrieve_sms
    sms = self.account.sms.messages
  end

end
