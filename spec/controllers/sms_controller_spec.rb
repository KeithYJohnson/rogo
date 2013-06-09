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

      binding.pry

      text = File.open('spec/json/samplejson.json', "r").read
      params = JSON.parse(text)
      post :create, params
    end

    it "returns http success" do
      response.should be_success
    end

  end

end
