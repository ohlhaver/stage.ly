class AddTypeIdToEvent < ActiveRecord::Migration
  def change
    add_column :events, :type_id, :integer
  end
end
