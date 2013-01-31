class AddCategoryIdToWork < ActiveRecord::Migration
  def change
    add_column :works, :category_id, :integer
  end
end
