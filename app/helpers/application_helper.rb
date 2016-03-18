#
# Methods in this file are only available to views.
#
module ApplicationHelper
  #
  class View
    attr_accessor :id, :name
    def initialize(url_params)
      @id = object_id
      @name = "#{url_params[:controller]}-#{url_params[:action]}"
    end
  end
end
