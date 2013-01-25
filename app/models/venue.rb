class Venue < ActiveRecord::Base
  attr_accessible :address, :name, :url
  has_many :events

  def to_param
  	"#{id}-#{name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end
end
