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

    @answer = Answer.find(params['Body'].to_i) if Answer.exists?(params['Body'].to_i)
    if @answer && @answer.id == 0
      binding.pry
      @message = @account.sms.messages.create({
      :from => '+13473217539',
      :to => @sms.from,
      :body => "Sorry that wasn't a valid option"
      })
      puts @message
    else
      binding.pry
      @answer.upvote

    end

    # if @answer == nil 
    #   @sms.send("error")
    # @answer.upvote
    render :nothing => true
  end

end

