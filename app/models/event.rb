class Event < ActiveRecord::Base
  attr_accessible :price, :time, :url, :venue_id, :title, :artist_ids, :type_id
  has_many :performances
  has_many :artists, through: :performances
  has_many :categories, through: :artists
  has_many :occasions
  has_many :works, through: :occasions
  has_many :composers, through: :works

  belongs_to :venue
  belongs_to :type
  before_save :generate_title

  define_index do
    indexes artists.name, :as => :artists
    indexes venue.name, :as => :venue
    indexes categories.name, :as => :categories
    indexes works.name, :as => :works
    indexes composers.name, :as => :composers

    has time
    
  end
  #belongs_to :artist, :polymorphic => true

  def generate_title
  	self.title = self.venue.name + " @ " + self.time.to_formatted_s(:long_ordinal)
  end

  def to_param
    "#{id}-#{artists.first.name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}-#{venue.name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end


end

