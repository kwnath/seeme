class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(sender: user).or(scope.where(recipient: user))
    end
  end

  def update?
    # meeting_owner_or_admin?
  end

  def destroy?
    # meeting_owner_or_admin?
  end

  def create?
    true
  end

  private

  def meeting_owner_or_admin?
    user == record.sender || user == record.recipient
  end

end
