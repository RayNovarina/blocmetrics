#
class RegisteredApplicationsController < ApplicationController
  before_action :make_view_helper

  def index
    @view.apps = RegisteredApplication.all
  end

  def show
    @view.app = RegisteredApplication.find(params[:id])
  end

  def new
    @view.app = RegisteredApplication.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def make_view_helper
    @view = ApplicationHelper::View.new(self, RegisteredApplication.new)
  end
end
