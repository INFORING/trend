class AddAssociationToTables < ActiveRecord::Migration
  def change
  	add_column :rows, :header_id, :integer
  	add_column :headers, :price_id, :integer
  end
end
