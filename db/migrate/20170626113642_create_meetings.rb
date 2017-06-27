class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :status
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
