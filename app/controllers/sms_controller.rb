# May want to nest this under 
# User model once feature 'User gets
# unique Twilio #' is done
# This will require dynamic routing on 
# the Twilio server side.  

class SmsController < ApplicationController
  def index

  end

  def create

    @sms = Sms.create(:from => params['From'], :body=> params['Body'], :to=>params["To"], :uri=>params['Uri'])
    binding.pry
    if Answer.exists?(params['Body'].to_i)
      @answer = Answer.find(params['Body'].to_i) 
      @answer.upvote
      @answer.save
    else 
      @account = client.account
      @message = @account.sms.messages.create({
      :from => '+13473217539',
      :to => @sms.from,
      :body => "Sorry that wasn't a valid option"
      })
      puts @message
    end
    render :nothing => true
  end

end
