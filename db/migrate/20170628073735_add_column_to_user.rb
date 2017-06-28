class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :gender, :boolean
    add_column :users, :language, :string
    add_column :users, :avatar, :string
    add_column :users, :admin, :boolean, :default => false
  end
end
