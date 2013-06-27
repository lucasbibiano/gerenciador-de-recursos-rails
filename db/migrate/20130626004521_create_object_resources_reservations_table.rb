# -*- encoding : utf-8 -*-
class CreateObjectResourcesReservationsTable < ActiveRecord::Migration
  def self.up
    create_table :object_resources_reservations, :id => false do |t|
        t.references :object_resource
        t.references :reservation
    end
    add_index :object_resources_reservations, [:object_resource_id, :reservation_id], name: "index1"
    add_index :object_resources_reservations, :reservation_id, name: "index2"
  end

  def self.down
    drop_table :object_resources_reservations
  end
end
