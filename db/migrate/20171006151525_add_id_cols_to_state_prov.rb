class AddIdColsToStateProv < ActiveRecord::Migration[5.1]
  def change
  	add_reference :state_provs, :country, index: true
  end

end
