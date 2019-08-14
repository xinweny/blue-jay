class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    user_is_owner?
  end

  def show?
    user_is_owner? || user_owns_band?
  end

  def create?
    true
  end

  def update?
    user_owns_band?
  end

  private

  def user_is_owner?
    record.user == user
  end

  def user_owns_band?
    record.band.user == user
  end
end
