class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :input_value
      t.timestamps
    end
  end
end
