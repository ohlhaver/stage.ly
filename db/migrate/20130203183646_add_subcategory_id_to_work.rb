class AddSubcategoryIdToWork < ActiveRecord::Migration
  def change
    add_column :works, :subcategory_id, :integer
  end
end
