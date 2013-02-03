class Work < ActiveRecord::Base
  attr_accessible :name, :category_id, :composer_ids, :category_ids, :subcategory_id
  has_many :compositions
  has_many :composers, :through => :compositions, :source => :artist

  has_many :occasions
  has_many :events, :through => :occasions
  belongs_to :category
  has_many :work_categories
  has_many :categories, :through => :work_categories
  belongs_to :subcategory

  validates_uniqueness_of :name, :case_sensitive => false


  def to_param
  	"#{id}-#{name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end
  
  #has_many :composers, :class_name => "Artist", source: :artists, through: :occasions 
end
  
