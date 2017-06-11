class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.references :prestation, foreign_key: true

      t.timestamps
    end
  end
end
