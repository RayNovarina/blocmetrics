#
class Users::SessionsController < Devise::SessionsController
  before_action :make_view_helper
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  # end

  # POST /resource/sign_in
  # def create
  # end

  # DELETE /resource/sign_out
  # def destroy
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  # There exists a similar method for sign in; after_sign_in_path_for
  def after_sign_out_path_for(_resource_or_scope)
    # require 'pry'
    # binding.pry
    # Note: at this time: flash[:notice] => "Signed out successfully."
    #                     current_user is nil.
    new_user_session_path # signIn page
  end

  def after_sign_in_path_for(_resource_or_scope)
    # require 'pry'
    # binding.pry
    # Note: at this time: flash[:notice] => "Signed in successfully."
    #                     current_user is valid.
    user_path(@view.current_user) # users#show
  end

  private

  def make_view_helper
    @view = ApplicationHelper::View.new(self, resource || User.new)
  end
end
