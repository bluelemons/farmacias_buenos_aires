class AddIndexToAddressToPlaces < ActiveRecord::Migration
  def change
    add_index :places, :address
  end
end
