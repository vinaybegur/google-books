class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :key_id
      t.string :authors
      t.string :title
      t.string :image_link
      t.timestamps
    end
  end
end
