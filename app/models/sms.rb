class Sms < ActiveRecord::Base
  attr_accessible :account_sid, :body, :date_create, :date_sent, :date_updated, :direction, :from, :sid, :status, :to, :uri
end
