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
    true
  end

  def requests?
    record == user
  end

  def approve?
    record == user
  end

  def reject?
    record == user
  end
end
