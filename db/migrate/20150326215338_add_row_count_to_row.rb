class AddRowCountToRow < ActiveRecord::Migration
  def change
  	add_column :rows, :row_count, :integer
  end
end
