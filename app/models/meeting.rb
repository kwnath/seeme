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

  # validates_uniqueness_of :sender_id, :scope => [:recipient_id, :sender_id]
  # validates_uniqueness_of :recipient_id, :scope => [:recipient_id, :sender_id]

  # validate :something

  # if sender_id

  def something
    if sender_id == recipient_id
      errors.add(:base, 'jay test')
    end
  end

end



