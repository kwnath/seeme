class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and

  # May need this for facebook/etc logins :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  acts_as_taggable_on :interests
end
