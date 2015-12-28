class CreateMarkers < ActiveRecord::Migration[5.0]
  def change
    create_table :markers do |t|
      t.string :name
      t.float :lat
      t.float :lng
      t.integer :user_id

      t.timestamps
    end
  end
end
