#
class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  def new
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # POST /resource/confirmation
  def create
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    super do |_resource|
      @view = ApplicationHelper::View.new(params)
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name)
  #   super(resource_name)
  # end
end