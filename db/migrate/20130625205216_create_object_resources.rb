class CreateObjectResources < ActiveRecord::Migration
  def change
    create_table :object_resources do |t|
      t.string :name
      t.text :description
      t.string :tombamento

      t.timestamps
    end
  end
end
