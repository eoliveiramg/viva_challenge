class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :lat
      t.integer :long
      t.integer :beds
      t.integer :baths
      t.integer :square_meters

      t.timestamps
    end
  end
end
