class CreateMapPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :map_points do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
