class Meeting < ApplicationRecord
  include AASM

  aasm :column => 'status' do
    state :pending, :initial => true
    state :accepted, :declined, :cancelled

    event :accept do
      transitions :from => :pending, :to => :accepted
    end

    event :decline do
      transitions :from => :pending, :to => :declined
    end

    event :cancel do
      transitions :from => [:accepted, :declined, :pending], :to => :cancelled
    end
  end
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User",foreign_key: "recipient_id"
  has_many :messages

  scope :between_user_ids, -> (user_a_id, user_b_id) { where("(recipient_id = ? and sender_id = ?) or (recipient_id = ? and sender_id = ?)", user_a_id, user_b_id, user_b_id, user_a_id) }
  scope :within_a_day, -> { where("created_at > ?", Date.yesterday) }

  validate :not_same_user
  validate :not_same_day

  def not_same_day

    meetings = Meeting.between_user_ids(sender_id, recipient_id).order(:created_at)
    return if meetings.empty?

    last_met = meetings.last.created_at

    cutoff = last_met + 1.day

    if Time.now < cutoff
      errors.add(:base, 'meetings of same people have to be 24 hours apart')
    end
  end

  def not_same_user
    if sender_id == recipient_id
      errors.add(:base, 'users cannot be the same one')
    end
  end

end



