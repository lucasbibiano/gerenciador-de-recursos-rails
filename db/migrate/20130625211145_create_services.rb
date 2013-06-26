class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description

      t.string :slug


      t.timestamps
    end
    
    add_index :services, :slug, :unique => true
  end
end
