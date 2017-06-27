class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and

  # May need this for facebook/etc logins :omniauthable
  has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"

  acts_as_taggable_on :interests
  has_many :sender_meetings, class_name: "Meeting", foreign_key: "sender_id"
  has_many :recipient_meetings, class_name: "Meeting", foreign_key: "sender_id"

  acts_as_token_authenticatable
end
