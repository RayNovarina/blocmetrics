#
class RegisteredApplicationPolicy < ApplicationPolicy
  # Permission to view a list of regd apps.
  # If authorized? request from controller we assume that record = @apps[]
  # Else could be permission to display link, i.e. policy(RegisteredApplication)
  def index?
    if user.present?
      # Is record an array of RegisteredApplication objects?
      (defined? record.length).nil? ? true : record.first.user == user
    end
    false
  end
end
