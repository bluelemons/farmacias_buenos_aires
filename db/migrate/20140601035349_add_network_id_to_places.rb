class AddNetworkIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :network_id, :integer
    add_index :places, :network_id
  end
end
