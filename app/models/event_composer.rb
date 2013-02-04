class EventComposer < ActiveRecord::Base
  attr_accessible :artist_id, :event_id
  belongs_to :artist
  belongs_to :event
end
