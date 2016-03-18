#
class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # POST /resource/password
  def create
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # PUT /resource/password
  def update
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
