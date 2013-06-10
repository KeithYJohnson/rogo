class Answer < ActiveRecord::Base
  attr_accessible :is_correct, :question_id, :title, :sms_answer_code, :votes

  belongs_to :question

  before_save :default_vote_count

  def upvote
    self.votes += 1
  end

  def default_vote_count
    self.votes ||= 0
  end

end
