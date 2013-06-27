# -*- encoding : utf-8 -*-
class CreatePlacesServicesTable < ActiveRecord::Migration
  def self.up
    create_table :places_services, :id => false do |t|
        t.references :place
        t.references :service
    end
    add_index :places_services, [:place_id, :service_id]
    add_index :places_services, :service_id
  end

  def self.down
    drop_table :places_services
  end
end
