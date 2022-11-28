class CreateLandmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :landmarks do |t|
      t.string :title
      t.string :location
      t.text :description
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
