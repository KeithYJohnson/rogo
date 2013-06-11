class Answer < ActiveRecord::Base
  attr_accessible :is_correct, :question_id, :title, :sms_answer_code, :votes

  belongs_to :question

  def upvote  
    self.votes += 1
  end

end
