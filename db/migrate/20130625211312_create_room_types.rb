class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :name
      t.text :description

      t.string :slug

      t.timestamps
    end

    add_index :room_types, :slug, :unique => true
  end
end
