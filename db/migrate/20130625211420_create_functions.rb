# -*- encoding : utf-8 -*-
class CreateFunctions < ActiveRecord::Migration
  def change
    create_table :functions do |t|
      t.string :name
      t.text :description

      t.string :slug

      t.timestamps
    end

    add_index :functions, :slug, :unique => true
  end
end
