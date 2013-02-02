class AddArtisttitleToEvent < ActiveRecord::Migration
  def change
    add_column :events, :artisttitle, :string
  end
end
