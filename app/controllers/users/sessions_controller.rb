#
class Users::SessionsController < Devise::SessionsController
  # before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # POST /resource/sign_in
  def create
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  # There exists a similar method for sign out; after_sign_out_path_for
  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path # signIn page
  end
end
