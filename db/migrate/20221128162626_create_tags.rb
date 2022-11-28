class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :title
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
