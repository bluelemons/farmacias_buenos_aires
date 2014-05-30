class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.belongs_to :location_id, index: true

      t.timestamps
    end
  end
end
