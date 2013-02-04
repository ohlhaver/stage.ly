class Event < ActiveRecord::Base
  attr_accessible :price, :time, :url, :venue_id, :title, :artist_ids, :type_id, :work_ids, :worktitle, :artisttitle, :category_ids, :direct_composer_ids, :subcategory_ids
  has_many :performances
  has_many :artists, through: :performances
  has_many :categories_from_artists, through: :artists, :source => :categories
  has_many :occasions
  has_many :works, through: :occasions
  has_many :categories_from_works, through: :works, :source => :categories
  has_many :composers, through: :works
  has_many :event_categories
  has_many :categories, through: :event_categories
  has_many :event_subcategories
  has_many :subcategories, through: :event_subcategories
  has_many :event_composers
  has_many :direct_composers, through: :event_composers, :source => :artist
  
  validates_presence_of :venue_id, :time, :type_id

  belongs_to :venue
  belongs_to :type
  before_save :generate_title
  after_save :generate_work
  after_save :generate_artists

  define_index do
    indexes artists.name, :as => :artists
    indexes venue.name, :as => :venue
    indexes categories.name, :as => :categories
    indexes works.name, :as => :works
    indexes composers.name, :as => :composers

    has time
    
  end
  #belongs_to :artist, :polymorphic => true

  def generate_title
    if self.works.any?
    workname = self.works.first.name
    elsif self.artists.any?
    workname = self.artists.first.name
    else
    workname = self.type.singular
    end


    
  	self.title = workname + " @ " + self.venue.name
  end

  def generate_work
    if self.worktitle != ""
      work = Work.find_or_create_by_name(self.worktitle)
      work.name = self.worktitle
      work.category_ids = self.category_ids if self.category_ids && work.category_ids.empty?
      work.save!
      Occasion.find_or_create_by_event_id_and_work_id(self.id, work.id)
    end
  end

  def generate_artists
    if self.artisttitle != ""
      artists = self.artisttitle.split(",")
      artists.each do |name|
        artist = Artist.find_or_create_by_name(name)
        artist.name = name
        artist.category_ids = self.category_ids if self.category_ids && artist.category_ids.empty?
        artist.save!
        Performance.find_or_create_by_event_id_and_artist_id(self.id, artist.id)

      end
    end
  end

  def to_param
      
        if works.any?
          this_title = works.first.name
        elsif artists.any?
          this_title = artists.first.name
        else
          this_title = type.singular
        end

    "#{id}-#{this_title.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}-#{venue.name.downcase.gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')}"
  end


end

