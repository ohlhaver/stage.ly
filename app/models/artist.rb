class Artist < ActiveRecord::Base
  attr_accessible :name, :category_ids
  has_many :performances
  has_many :events, through: :performances
  has_many :affinities
  has_many :categories, through: :affinities
  has_many :compositions
  has_many :works, through: :compositions

  validates_uniqueness_of :name, :case_sensitive => false



  def to_param
  	"#{id}-#{name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end

end
