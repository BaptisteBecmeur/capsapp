class CreatePrestations < ActiveRecord::Migration[5.0]
  def change
    create_table :prestations do |t|
      t.string :talent
      t.string :showing_type
      t.integer :duration
      t.integer :zone_km
      t.string :name_scene
      t.string :listing_name
      t.text :summary
      t.string :address
      t.string :zip_code
      t.string :city
      t.string :country
      t.boolean :is_equipment
      t.boolean :is_indoor
      t.boolean :is_outdoor
      t.integer :price
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
