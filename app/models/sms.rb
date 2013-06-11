class Sms < ActiveRecord::Base
  attr_accessible :account_sid, :body, :date_create, :date_sent, :date_updated, :direction, :from, :sid, :status, :to, :uri
  belongs_to :question
  belongs_to :poll  #ActiveRecordmoving :through => questions, was throwing an error
end
