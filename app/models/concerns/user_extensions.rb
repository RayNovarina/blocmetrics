# per: https://richonrails.com/articles/rails-4-code-concerns-in-active-record-models
module UserExtensions
  extend ActiveSupport::Concern
  #
  included do
    # The code contained within the included block will be executed within the
    # context of the class that is including the module. This is perfect for
    # including functionality provided by 3rd party gems, etc.
    # Example:
    # has_secure_password
  end
  #
  #======== CLASS METHODS, i.e. User.authenticate()
  #
  # The code contained within this block will be added to the Class itself.
  # For example, the code above adds an authenticate function to the User class.
  # This allows you to do User.authenticate(email, password) instead of
  # User.find_by_email(email).authenticate(password).
  module ClassMethods
    #
    # Note: include helper methods for all models, such as return_view_hash_of.
    # include ModelHelper # /models/concerns/model_helper.rb
    #
    # def authenticate(email, password)
    #   user = find_by_email(email)
    #   user if user && user.authenticate(password)
    # end
    #
    # Note: controller actions interface:
    # Inputs: url_params = hash of url params from the controller/browser.
    # Return: depends on method or action. Usually a activeRecord is returned.
    # def index_action(_url_params)
    #  User.all
    # end
  end
  #
  #======== INSTANCE METHODS, i.e. User.find_by(1).create_password_token()
  #
  # Code not included in the ClassMethods block or the included block will be
  # included as instance methods.
  # For example, You could do @user = User.find(params[:id]) and then do
  #                           @user.create_password_reset_token
  # to create a password reset token for the specified user.
  #
  # def create_password_reset_token
  #   self.password_reset_token = 123
  # end
  #
  # The liked? method will let you know if a given user has liked a bookmark
  # def liked?(bookmark)
  #  Like.where(bookmark_id: bookmark.id).first
  # end
end
