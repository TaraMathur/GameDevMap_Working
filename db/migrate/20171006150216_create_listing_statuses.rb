class CreateListingStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :listing_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
