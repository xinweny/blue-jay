class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true if user.nil?
    return true if user.bookings.find { |booking| booking.band == record.band }

    return false
  end
end
