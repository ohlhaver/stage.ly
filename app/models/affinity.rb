class Affinity < ActiveRecord::Base
  attr_accessible :artist_id, :category_id, :title
  belongs_to :artist
  belongs_to :category
  before_save :generate_title

  def generate_title
  	self.title = self.artist.name + " & " + self.category.name
  end
end

