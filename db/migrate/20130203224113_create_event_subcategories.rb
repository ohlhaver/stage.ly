class CreateEventSubcategories < ActiveRecord::Migration
  def change
    create_table :event_subcategories do |t|
      t.integer :event_id
      t.integer :subcategory_id

      t.timestamps
    end
  end
end
