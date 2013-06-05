class PollsController < ApplicationController

  def index
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file

    # localtunnel -k ~/.ssh/id_rsa.pub 8080
    # @message_body = params["Body"]
    # from_number = params["From"]
    # render @polls, :locals => {:message_body => @message_body}
    # # render text: params
    # SMSLogger.log_text_message from_number, message_body

    @polls
    # render 'process_sms.xml.erb', :content_type => 'text/xml'

  end

  def create
    @poll = Poll.create(params[:poll])
  end

  def new
    @poll = Poll.new  
  end

  def show
    
  end

  def process_sms

  end

  def update
  end

  def edit

  end

end
