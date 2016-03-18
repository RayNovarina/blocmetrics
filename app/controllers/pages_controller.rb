#
class PagesController < ApplicationController
  def index
    @view = ApplicationHelper::View.new(params)
  end

  def about
    @view = ApplicationHelper::View.new(params)
  end
end
