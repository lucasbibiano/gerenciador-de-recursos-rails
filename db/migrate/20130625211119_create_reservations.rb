# -*- encoding : utf-8 -*-
class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :begin
      t.datetime :end
      t.string :status
      t.references :user
      t.references :place

      t.timestamps
    end
  end
end
