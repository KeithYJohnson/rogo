class Question < ActiveRecord::Base
  attr_accessible :poll_id, :title

  belongs_to :poll
  has_many :answers, :dependent => :destroy
  # THis is the plularized form of sms, it's not smss
  has_many :sms
                                          #If someone creates a form with a blank question field at the end, this will prevent it from being rendered on teh show page
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank?}

end
