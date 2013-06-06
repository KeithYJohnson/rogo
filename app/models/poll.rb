class Poll < ActiveRecord::Base
  attr_accessible :description, :end_time, :start_time, :title, :user_id, :questions_attributes

  belongs_to :user
  has_many :questions, :dependent => :destroy
  # This is the plularized form of sms, it's not smss
  has_many :sms, :through => :questions 
  has_many :feedbacks

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank?}, :allow_destroy => true
end
