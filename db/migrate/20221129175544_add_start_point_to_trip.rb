class AddStartPointToTrip < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :start_point, :string
  end
end
