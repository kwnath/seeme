class AddLatitudeToUsers < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :lat, :decimal, {:precision=>10, :scale=>6}
  end
end
