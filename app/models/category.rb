class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :affinities
  has_many :artists, through: :affinities
  has_many :events, through: :artists

  def to_param
  	"#{id}-#{name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}-berlin"
  end
end
