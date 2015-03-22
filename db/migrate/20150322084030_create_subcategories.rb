class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :title
      t.integer :category_id

      t.timestamps
    end
  end
end
