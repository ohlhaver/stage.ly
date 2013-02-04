class AddMissingIndexes < ActiveRecord::Migration
      def change
        add_index :event_composers, :artist_id
        add_index :event_composers, :event_id
        add_index :event_composers, [:artist_id, :event_id]
        add_index :event_categories, :event_id
        add_index :event_categories, :category_id
        add_index :event_categories, [:category_id, :event_id]
        add_index :categories, :type_id
        add_index :compositions, :artist_id
        add_index :compositions, :work_id
        add_index :compositions, [:artist_id, :work_id]
        add_index :affinities, :artist_id
        add_index :affinities, :category_id
        add_index :work_categories, :work_id
        add_index :work_categories, :category_id
        add_index :work_categories, [:category_id, :work_id]
        add_index :events, :venue_id
        add_index :events, :type_id
        add_index :subcategories, :category_id
        add_index :performances, :event_id
        add_index :performances, :artist_id
        add_index :event_subcategories, :event_id
        add_index :event_subcategories, :subcategory_id
        add_index :occasions, :event_id
        add_index :occasions, :work_id
      end
    

end
