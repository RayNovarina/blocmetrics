#
# Methods in this file are only available to views.
#
module ApplicationHelper
  #
  class View
    attr_reader :id, :name
    attr_accessor :locals, :signed_out_user, :user, :apps, :app, :events,
                  :event, :event_group_counts

    def initialize(controller, model)
      @id = object_id
      url_params = controller.params || []
      @name = "#{url_params[:controller]}-#{url_params[:action]}"
      @controller = controller
      @model = model
    end

    # def set_locals(new_locals)
    #  @locals = new_locals
    # end

    # def locals
    #  @locals
    # end

    # def locals(arg)
    #  if defined? arg == 'Hash'
    #    @locals = new_locals if defined? arg == 'Hash'
    #    self
    #  else
    #    @locals[arg]
    #  end
    # end

    # If authentication system (i.e. Devise) active.
    # controller.is_a?(::DeviseController)
    def devise?
      !(defined? @controller.current_user).nil?
    end

    # If authorized roles (Pundit or Devise?).
    def roles?
      false # !(defined? User.new.roles).nil?
    end

    # Most devise helpers for views and controllers are found in sources at:
    #   gems/devise-3.5.6/lib/devise/controllers/helpers.rb
    def user_signed_in?
      # Note: user_signed_in? is a devise method visible to our controllers.
      #       Method defined at:
      # /gems/ruby-2.2.4/gems/devise-3.5.6/lib/devise/controllers/helpers.rb
      devise? ? @controller.user_signed_in? : true
    end

    def current_user
      # Note: current_user is a devise method visible to our controllers.
      #       Method defined at:
      # /gems/ruby-2.2.4/gems/devise-3.5.6/lib/devise/controllers/helpers.rb
      devise? ? @controller.current_user : User.new
    end

    #
    def flash_messages
      @controller.flash
    end
  end
end
