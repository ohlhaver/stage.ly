class WorkCategory < ActiveRecord::Base
  attr_accessible :category_id, :work_id
  belongs_to :work
  belongs_to :category
end
