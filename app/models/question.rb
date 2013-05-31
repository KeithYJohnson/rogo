class Question < ActiveRecord::Base
  attr_accessible :poll_id, :title

  belongs_to :poll
  has_many :answers
  # THis is the plularized form of sms, it's not smss
  has_many :sms
end
