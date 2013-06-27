# -*- encoding : utf-8 -*-
class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name
      t.text :description

      t.string :slug

      t.timestamps
    end

    add_index :sectors, :slug, :unique => true
  end
end
