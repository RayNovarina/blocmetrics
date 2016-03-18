#
class RegisteredApplicationPolicy < ApplicationPolicy
  # Permission to view a list of regd apps.
  # If authorized? request from controller we assume that record = @apps[]
  # Else could be permission to display link, i.e. policy(RegisteredApplication)
  def index?
    return false unless user.present?
    # Only check for user if record is an array of RegisteredApplication objs
    return true if (defined? record.length).nil? || record.empty?
    record.first.user == user
  end
end
