class CreateWorkCategories < ActiveRecord::Migration
  def change
    create_table :work_categories do |t|
      t.integer :work_id
      t.integer :category_id

      t.timestamps
    end
  end
end
