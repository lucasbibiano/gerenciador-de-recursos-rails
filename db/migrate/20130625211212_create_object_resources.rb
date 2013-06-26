class CreateObjectResources < ActiveRecord::Migration
  def change
    create_table :object_resources do |t|
      t.string :name
      t.text :description
      t.string :tombamento, :unique => true
      t.references :sector
      t.references :place

      t.string :slug

      t.timestamps
    end

    add_index :object_resources, :slug, :unique => true
    add_index :object_resources, :tombamento, :unique => true
  end
end
