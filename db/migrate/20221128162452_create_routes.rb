class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.date :travel_date
      t.string :destination
      t.string :method
      t.integer :duration
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
