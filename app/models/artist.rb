class Artist < ActiveRecord::Base
  attr_accessible :name
  has_many :performances
  has_many :events, through: :performances
  has_many :affinities
  has_many :categories, through: :affinities
  has_many :compositions
  has_many :works, through: :compositions

end
