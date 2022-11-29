class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.string :title
      t.text :description
      t.integer :likes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
