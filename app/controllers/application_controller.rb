#
class ApplicationController < ActionController::Base
  # Use Pundit for authorization/permissions.
  include Pundit
  # Customize the user_not_authorized method in every controller.
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #============== DEVISE Authentication gem related ===========================
  # per doc at: https://github.com/plataformatec/devise#getting-started
  # Most devise helpers for views and controllers are found in sources at:
  #   gems/devise-3.5.6/lib/devise/controllers/helpers.rb
  #   I generated copies of the devise controllers to /app/controllers/users
  #   and set the sign_in and sign_out paths, added name to sign_up page, etc.
  #     after_sign_out_path_for method in
  #       controllers/users/sessions_controller.rb
  #   after_sign_in_path_for method in
  #       controllers/users/sessions_controller.rb
  #   after_sign_up_path_for method in
  #       controllers/users/sessions_controller.rb
  #   Added name to configure_sign_up_params at
  #      controllers/users/registrations_controller.rb
  #   Added name to configure_account_update_params at
  #      controllers/users/registrations_controller.rb
  #   If name added to sign_in form, add name to configure_sign_in_params at
  #       controllers/users/sessions_controller.rb

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
