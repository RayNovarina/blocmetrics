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
  #   I generated copies of the devise controllers to /app/controllers/users
  #   and set the sign_in and sign_out paths, added name to sign_up page, etc.

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
