class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :name
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
