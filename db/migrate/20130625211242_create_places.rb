class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :code
      t.integer :capacity
      t.integer :width
      t.integer :length
      t.references :room_type
      t.references :sector

      t.string :slug


      t.timestamps
    end
    
    add_index :places, :slug, :unique => true
  end
end
