class Category < ActiveRecord::Base
  attr_accessible :name, :type_id
  has_many :affinities
  has_many :artists, through: :affinities
  has_many :events, through: :artists
  has_many :work_categories
  has_many :works, :through => :work_categories


  def to_param
  	"#{id}-#{name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}-luebeck"
  end
end
