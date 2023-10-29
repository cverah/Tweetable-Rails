class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
  def admin?
    user.admin? unless user.nil?
  end
  def member?
    user.member? unless user.nil?
  end
end
