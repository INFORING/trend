class AddDescriptionToCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :description, :text
  	add_column :subcategories, :description, :text
  end
end
