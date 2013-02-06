class AddCancelledToEvent < ActiveRecord::Migration
  def change
    add_column :events, :cancelled, :boolean
  end
end
