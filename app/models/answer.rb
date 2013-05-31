class Answer < ActiveRecord::Base
  attr_accessible :is_correct, :question_id, :title

  belongs_to :question
end
