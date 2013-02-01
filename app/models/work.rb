class Work < ActiveRecord::Base
  attr_accessible :name, :category_id, :composer_ids, :category_ids
  has_many :compositions
  has_many :composers, :through => :compositions, :source => :artist

  has_many :occasions
  belongs_to :category
  has_many :work_categories
  has_many :categories, :through => :work_categories
  
  #has_many :composers, :class_name => "Artist", source: :artists, through: :occasions 
end
  
