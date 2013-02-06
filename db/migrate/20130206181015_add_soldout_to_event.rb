class AddSoldoutToEvent < ActiveRecord::Migration
  def change
    add_column :events, :soldout, :boolean
  end
end
