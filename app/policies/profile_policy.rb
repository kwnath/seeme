class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    end
  end

  def update?
    # record.user == user
    true
  end

end
