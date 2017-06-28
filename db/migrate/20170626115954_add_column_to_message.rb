class AddColumnToMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :meeting, foreign_key: true
  end
end
