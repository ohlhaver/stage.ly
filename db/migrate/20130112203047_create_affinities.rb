class CreateAffinities < ActiveRecord::Migration
  def change
    create_table :affinities do |t|
      t.integer :artist_id
      t.integer :category_id

      t.timestamps
    end
  end
end
