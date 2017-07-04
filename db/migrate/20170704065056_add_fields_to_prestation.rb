class AddFieldsToPrestation < ActiveRecord::Migration[5.0]
  def change
    add_column :prestations, :latitude, :float
    add_column :prestations, :longitude, :float
  end
end
