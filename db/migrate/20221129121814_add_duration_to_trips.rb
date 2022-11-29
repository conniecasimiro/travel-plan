class AddDurationToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :duration, :integer
  end
end
