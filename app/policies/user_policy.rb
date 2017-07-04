class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    true
  end

  def addhobby?
    update?
  end

  def search?
    true
  end
end
