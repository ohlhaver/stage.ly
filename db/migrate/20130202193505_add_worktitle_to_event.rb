class AddWorktitleToEvent < ActiveRecord::Migration
  def change
    add_column :events, :worktitle, :string
  end
end
