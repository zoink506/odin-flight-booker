class DropAirports < ActiveRecord::Migration[7.0]
  def change
    drop_table :airports
  end
end
