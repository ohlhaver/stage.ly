class EventSubcategory < ActiveRecord::Base
  attr_accessible :event_id, :subcategory_id
  belongs_to :event
  belongs_to :subcategory
end
