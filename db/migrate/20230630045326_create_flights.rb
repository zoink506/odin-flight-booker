class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :airport_from, index: true, foreign_key: { to_table: :airports }
      t.references :airport_to, index: true, foreign_key: { to_table: :airports }
      t.datetime :departure_date
      t.integer :duration

      t.timestamps
    end
  end
end
