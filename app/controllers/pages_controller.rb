#
class PagesController < ApplicationController
  before_action :make_view_helper

  def index
  end

  def about
  end

  private

  def make_view_helper
    @view = ApplicationHelper::View.new(self, User.new)
  end
end
