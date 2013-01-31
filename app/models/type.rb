class Type < ActiveRecord::Base
  attr_accessible :name, :event_ids, :singular
  has_many :events
end
