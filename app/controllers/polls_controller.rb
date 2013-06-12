class PollsController < ApplicationController
  respond_to :html, :js
  def index

    @polls

  end

  def create
    @poll = current_user.polls.new(params[:poll])
    # @poll = Poll.create(params[:poll])
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
    # Mapping answer titles with their votes 
    gon.poll = @poll.questions[0].answers.map{|answer| [answer.title, answer.votes]}
    gon.votes = @poll.questions[0].answers.map{|answer| answer.votes}
    @question = @poll.questions[0]
    @answers = @question.answers

    respond_to do |format|

      format.html { @poll}

      format.js {
        render json: gon.votes
      }
    end
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

  def toggle_live
    @poll = Poll.find(params[:poll_id])
    @poll.toggle_live
    @poll.save!
  end

  def edit
    @poll = Poll.find(params[:id])
    @questions = @poll.questions[0]
    @answers = @questions.answers
  end

  def destroy
    @poll = Poll.find(params[:id])
    @poll.destroy
    render :nothing => true
  end

end
