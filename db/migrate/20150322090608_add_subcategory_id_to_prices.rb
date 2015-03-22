class AddSubcategoryIdToPrices < ActiveRecord::Migration
  def change
  	add_column :prices, :subcategory_id, :integer
	end
end
