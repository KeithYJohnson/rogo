require 'spec_helper'
require 'machinist'


describe PollsController do
  # before do
  #   binding.pry
  #   @user.make! 

  #   sign_in @user
  # end


  describe "post to index" do
    before do
      text = File.open('spec/json/samplejson.json', "r").read
      params = JSON.parse(text)

      post :index, params
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  # describe "creates a poll with Q&A" do
  #   before do
  #     post :create, :poll => {:title => "A Test Poll", "questions_attributes"=>{"0
  #     "=>{"title"=>"With this poll pass the test?"}}}
  #   end

  #   it "should make a polls questions" do
  #     expect(assigns(:poll)).to be_a_new(Poll)

  #   end
  # end

  describe "post to toggle_live" do
    before do
      @poll = Poll.find(30)
      # post :toggle_live, :poll => @poll
    end

    it 'returns http succes' do
      post 'toggle_live'
      response.should be_success
    end
  end


  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end
end

