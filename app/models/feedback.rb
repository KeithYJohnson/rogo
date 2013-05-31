class Feedback < ActiveRecord::Base
  attr_accessible :poll_id, :suggestion

  belongs_to :poll
end
