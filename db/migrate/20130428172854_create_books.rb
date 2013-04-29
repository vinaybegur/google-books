class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :authors
      t.string :title
      t.string :image_link
      t.timestamps
    end
  end
end
