class Poll < ActiveRecord::Base
  attr_accessible :description, :end_time, :start_time, :title, :user_id, :questions_attributes, :is_live

  belongs_to :user
  has_many :questions, :dependent => :destroy
  # This is the plularized form of sms, it's not smss
  has_many :sms  #removing through questions, was throwing an error
  has_many :feedbacks

  accepts_nested_attributes_for :questions, :allow_destroy => true

  def toggle_live
    self.is_live = !self.is_live
  end
end

