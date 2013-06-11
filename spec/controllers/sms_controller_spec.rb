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
      # @answers = @poll.questions[0].answers
    end

    describe "SMS doesn't match an answer" do
      before do
        # Would have to mock an out-of-range-sms
        @sms.create!
        params['body'] = 'lerkj'
        post :create, @sms
      end

      it "should send sms response if answer is out of range" do
        before do

        end

      end


    end
  end
end
