class CreateCategory < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :label
    end
  end
end
