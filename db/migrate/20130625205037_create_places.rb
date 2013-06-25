class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :code
      t.integer :capacity
      t.integer :width
      t.integer :length

      t.timestamps
    end
  end
end
