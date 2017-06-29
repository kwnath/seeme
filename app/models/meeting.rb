class Meeting < ApplicationRecord
  include AASM

  aasm :column => 'status' do
    state :pending, :initial => true
    state :accepted, :declined, :closed

    event :accept do
      transitions :from => :pending, :to => :accepted
    end

    event :accept do
      transitions :from => :accept, :to => :closed
    end

    event :decline do
      transitions :from => :pending, :to => :declined
    end

    event :decline do
      transitions :from => :decline, :to => :closed
    end

    # event :pending do
    #   transitions :from => [:accepted, :declined], :to => :pending
    # end
  end
  belongs_to :sender, class_name: "User", foreign_key: "sender_id"
  belongs_to :recipient, class_name: "User",foreign_key: "recipient_id"
  has_many :messages
end
