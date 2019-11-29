class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    update?
  end

  def update?
    return true#record == user
  end

  def destroy?
    return true
  end

  def requests?
    true
  end

  def approve?
    true
  end

  def reject?
    true
  end
end
