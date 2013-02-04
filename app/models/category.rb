class Category < ActiveRecord::Base
  attr_accessible :name, :type_id
  has_many :affinities
  has_many :artists, through: :affinities
  has_many :events_from_artists, through: :artists, :source => :events
  has_many :work_categories
  has_many :works, :through => :work_categories
  has_many :events_from_works, through: :works, :source => :events
  has_many :event_categories
  has_many :events, through: :event_categories
  has_many :subcategories
  belongs_to :type

  validates_uniqueness_of :name, :case_sensitive => false


  def to_param
  	"#{id}-#{name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}-luebeck"
  end
end
