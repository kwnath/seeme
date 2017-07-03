class AddLongitudeToUsers < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
