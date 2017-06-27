class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and

  # May need this for facebook/etc logins :omniauthable
  devise :database_authenticatable, :trackable, :validatable, :registerable

  has_many :messages, class_name: "Message", foreign_key: "recipient_id"
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"

  acts_as_taggable_on :interests
  acts_as_token_authenticatable
  has_many :meeting
end
