class MeetingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(sender: user).or(scope.where(recipient: user))
      user.meetings
    end
  end

  def index?
    record.sender == user || record.recipient == user
  end

  def update?
    meeting_owner_or_admin?
  end

  def destroy?
    meeting_owner_or_admin?
  end

  def create?
    true
  end

  private

  def meeting_owner_or_admin?
    user == record.sender || user == record.recipient
  end

end
