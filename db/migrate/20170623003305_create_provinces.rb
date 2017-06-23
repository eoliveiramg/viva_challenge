class CreateProvinces < ActiveRecord::Migration[5.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.integer :upper_left_x
      t.integer :upper_left_y
      t.integer :bottom_right_x
      t.integer :bottom_right_y
    end
  end
end
