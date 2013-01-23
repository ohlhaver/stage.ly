class Composition < ActiveRecord::Base
  attr_accessible :artist_id, :work_id
  belongs_to :artist
  belongs_to :work
end
