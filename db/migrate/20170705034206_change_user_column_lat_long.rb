class ChangeUserColumnLatLong < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :latitude, :float, default: 31.219830
    change_column :users, :longitude, :float, default: 121.443782
  end
end
