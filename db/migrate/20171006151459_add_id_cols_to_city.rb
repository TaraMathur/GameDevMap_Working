class AddIdColsToCity < ActiveRecord::Migration[5.1]
  def change
    add_reference :cities, :state_prov, index: true
    add_reference :cities, :region, index: true
    add_reference :cities, :map_point, index: true
  end
end
