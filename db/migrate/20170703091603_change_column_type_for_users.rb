class ChangeColumnTypeForUsers < ActiveRecord::Migration[5.0]
  def change
    change_column(:users, :lat, :float)
    change_column(:users, :lng, :float)
  end
end
