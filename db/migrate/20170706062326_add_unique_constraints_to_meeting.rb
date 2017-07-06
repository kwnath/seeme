class AddUniqueConstraintsToMeeting < ActiveRecord::Migration[5.0]
  def change
    add_index :meetings, [:sender_id, :recipient_id], unique: true
  end
end
