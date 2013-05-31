class Poll < ActiveRecord::Base
  attr_accessible :description, :end_time, :start_time, :title, :user_id

  belongs_to :user
  has_many :questions
  # This is the plularized form of sms, it's not smss
  has_many :sms, :through => :questions 
  has_many :feedbacks
end
