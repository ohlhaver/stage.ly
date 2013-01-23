class AddTitleColumnToPerformance < ActiveRecord::Migration
  def change
    add_column :performances, :title, :string
  end
end
