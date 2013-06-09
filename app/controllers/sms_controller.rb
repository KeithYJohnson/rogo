# May want to nest this under 
# User model once feature 'User gets
# unique Twilio #' is done
# This will require dynamic routing on 
# the Twilio server side.  
class SmsController < ApplicationController
  def index

  end

  def create
    @sms = Sms.create(:from => params['from'], :body=> params['body'], :to=>params["to"], :uri=>params['uri'])

    @answer = Answer.find(params['body'].to_i)
    # if @answer == nil 
    #   @sms.send("error")
    # @answer.upvote
    render :nothing => true
  end

end
