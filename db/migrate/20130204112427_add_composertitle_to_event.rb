class AddComposertitleToEvent < ActiveRecord::Migration
  def change
    add_column :events, :composertitle, :string
  end
end
