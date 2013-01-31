class AddTypeIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :type_id, :integer
  end
end
