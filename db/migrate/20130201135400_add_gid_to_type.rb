class AddGidToType < ActiveRecord::Migration
  def change
    add_column :types, :gid, :integer
  end
end
