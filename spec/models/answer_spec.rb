require 'spec_helper'

describe Answer do
  before do
    @answer = Answer.make!
    @answer.save
  end

  it "should have a default vote value of zero" do
    @answer.votes.should eq(0)
  end

end
