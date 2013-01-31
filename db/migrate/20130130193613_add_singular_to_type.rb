class AddSingularToType < ActiveRecord::Migration
  def change
    add_column :types, :singular, :string
  end
end
