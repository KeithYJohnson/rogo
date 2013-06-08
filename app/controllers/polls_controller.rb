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
    binding.pry
    @poll = current_user.polls.new(params[:poll])
    # @poll = Poll.create(params[:poll])
    binding.pry
    @poll.save!
    redirect_to root_path
  end

  def new
    @poll = Poll.new  

    1.times do
      question = @poll.questions.build
      2.times {question.answers.build}
    end
  end

  def show
    @poll = Poll.find(params[:id])
    @question = @poll.questions[0]
    @answers = @question.answers
    @poll
  end

  def process_sms

  end

  def update
    @poll = Poll.find(params[:id])

    respond_to do |format|
      if @poll.update_attributes(params[:poll])
        format.html { redirect_to @poll, notice: 'poll was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @poll = Poll.find(params[:id])
    @questions = @poll.questions[0]
    @answers = @questions.answers
  end

end
