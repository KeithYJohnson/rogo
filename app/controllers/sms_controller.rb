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

    @answer = Answer.find(params['Body'].to_i)
    binding.pry
    if @answer == nil
      @client.account.sms.messages.create(
      :from => '+13473217539',
      :to => @sms.from,
      :body => "Sorry that wasn't a valid option"
      )
    else
      @answer.upvote

    end

    # if @answer == nil 
    #   @sms.send("error")
    # @answer.upvote
    render :nothing => true
  end

end
