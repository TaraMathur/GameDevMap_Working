class AddIdColsToCompany < ActiveRecord::Migration[5.1]
  def change
  	add_reference :companies, :city, index: true
    add_reference :companies, :category, index: true
    add_reference :companies, :listing_status, index: true
  end
end
