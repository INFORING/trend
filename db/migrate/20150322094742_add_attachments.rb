class AddAttachments < ActiveRecord::Migration
  def change
  	add_attachment :categories, :image
  	add_attachment :prices, :image
  end
end
