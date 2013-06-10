require 'spec_helper'

describe SmsController do

  # describe "GET 'index'" do
  #   it "returns http success" do
  #     get 'index'
  #     response.should be_success
  #   end
  # end

  describe "POST 'create'" do

    before do
      @poll = Poll.make!
      1.times { 
        q = @poll.questions.make!

        3.times {
          q.answers.make!
        }
      }


      text = File.open('spec/json/samplejson.json', "r").read
      params = JSON.parse(text)
      post :create, params
      @answers = @poll.questions[0].answers
    end

    it "returns http success" do
      response.should be_success
    end



    it "adds one to that answer's vote column" do
      
    end


  end

end
