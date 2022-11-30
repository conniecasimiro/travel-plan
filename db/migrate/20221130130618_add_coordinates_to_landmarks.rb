class AddCoordinatesToLandmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :landmarks, :latitude, :float
    add_column :landmarks, :longitude, :float
  end
end
