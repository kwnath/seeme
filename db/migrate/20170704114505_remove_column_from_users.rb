class RemoveColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :lat, :decimal
    remove_column :users, :lng, :decimal
  end
end
