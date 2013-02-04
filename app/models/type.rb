class Type < ActiveRecord::Base
  attr_accessible :name, :event_ids, :singular, :gid
  has_many :events
  has_many :categories
  validates_uniqueness_of :name, :case_sensitive => false

  def to_param
  	"#{id}-#{name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}-luebeck"
  end
end
