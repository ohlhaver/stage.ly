class AddTitleColumnToAffinity < ActiveRecord::Migration
  def change
    add_column :affinities, :title, :string
  end
end
