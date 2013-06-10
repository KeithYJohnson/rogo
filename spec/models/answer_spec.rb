require 'spec_helper'

describe Answer do
  before do
    @answer = Answer.make!
    @answer.save
  end

  it "should have a default vote value of zero" do
    @answer.votes.should eq(0)
  end

  describe '.upvote' do

    it 'should increment votes value by 1' do
      @answer.upvote.should eq(1)
    end
  end


end
