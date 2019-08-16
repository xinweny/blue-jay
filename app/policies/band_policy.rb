class BandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
    end
  end

  def show?
    return true
  end

  def index?
    return true
  end

  def create?
    return true
  end

  def update?
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  def my_bands?
    return true
  end

  def tagged?
    return true
  end

  private

  def user_is_owner?
    record.user == user
  end
end
