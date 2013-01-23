class Performance < ActiveRecord::Base
  attr_accessible :artist_id, :event_id, :title
  belongs_to :event
  belongs_to :artist
  before_save :generate_title

  def generate_title
  	self.title = self.artist.name + " @ " + self.event.title
  end
end
