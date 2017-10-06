class CreateStateProvs < ActiveRecord::Migration[5.1]
  def change
    create_table :state_provs do |t|
      t.string :name

      t.timestamps
    end
  end
end
