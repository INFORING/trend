class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string :title

      t.timestamps
    end
  end
end
