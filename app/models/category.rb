class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :affinities
  has_many :artists, through: :affinities
  has_many :events, through: :artists
end
