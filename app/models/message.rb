class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User",foreign_key: "recipient_id"
  # scope: :unread, -> { where read: false }
  belongs_to :meeting

  # scope :between, -> (sender_id,recipient_id) do
  #    where(“(meeting.sender_id = ? AND meeting.recipient_id =?) OR (meeting.sender_id = ? AND meeting.recipient_id =?)”, sender_id,recipient_id, recipient_id, sender_id)
  #  end

  def message_time
    created_at.strftime("%l:%M")
  end
end
