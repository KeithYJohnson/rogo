# Changed casing in JSON sample; difference in test/real ENVs
require 'spec_helper'

describe SmsController do

  before do
    test_account_sid = 'ACa7ebbf165e2a6cdbcc9269fce923e235'
    test_auth_token = '3161184af1b4876b296c6b92d8ba9dea'
    client = Twilio::REST::Client.new test_account_sid, test_auth_token
  end

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
        @good_sms = JSON.parse(text)
        post :create, @good_sms
      end

      it 'should create an sms object' do
        assigns(:sms).from.should be
      end 

      it 'should find a matching answer' do
        Answer.exists?(@good_sms['Body'].to_i).should eq(true)
      end

      it 'should return http success' do
        response.should be_success
      end



    end

    describe "SMS doesn't match a possible survey's answer" do
      before do
        file = File.open('spec/json/out_of_range_sms.json', "r").read
        @bad_sms = JSON.parse(file)
        post :create, @bad_sms
      end

      it 'should not find a matching answer' do
        Answer.exists?(@bad_sms['Body'].to_i).should eq(false)
      end 
    end

  end
end
