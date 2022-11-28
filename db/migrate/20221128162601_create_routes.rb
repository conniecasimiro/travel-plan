class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :start_point
      t.string :end_point
      t.string :method
      t.integer :duration
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
