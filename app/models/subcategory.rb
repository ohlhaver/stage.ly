class Subcategory < ActiveRecord::Base
  attr_accessible :category_id, :name
  belongs_to :category
  default_scope order: 'subcategories.name ASC'
end
