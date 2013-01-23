class Occasion < ActiveRecord::Base
  attr_accessible :event_id, :work_id
  belongs_to :event
  belongs_to :work
end
