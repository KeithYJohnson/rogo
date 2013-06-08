class Answer < ActiveRecord::Base
  attr_accessible :is_correct, :question_id, :title, :sms_answer_code

  belongs_to :question

  def generate_sms_answer_code
      
  end

end
