class CreateMovie < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.string :image_link, null: false
      t.date :release_date, null: false

      t.timestamps
    end
  end
end
