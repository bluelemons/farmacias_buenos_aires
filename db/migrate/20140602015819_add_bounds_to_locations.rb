class AddBoundsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :bounds, :text
  end
end
