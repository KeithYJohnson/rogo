require 'spec_helper'


describe PollsController do

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

  describe "GET 'index'" do

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

