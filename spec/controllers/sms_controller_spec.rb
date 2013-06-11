# Changed casing in JSON sample; difference in test/real ENVs
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

    end

    describe "SMS matches a survey's answer" do
      before do
        text = File.open('spec/json/samplejson.json', "r").read
        good_sms = JSON.parse(text)
        post :create, good_sms
      end

      it 'should return http success' do
        response.should be_success
      end


    end

    describe "SMS doesn't match a possible survey's answer" do
      before do
        file = File.open('spec/json/out_of_range_sms.json', "r").read
        bad_sms = JSON.parse(file)
        post :create, bad_sms
      end
    end

  end
end
