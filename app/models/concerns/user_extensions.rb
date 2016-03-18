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
    #
    #-------------------- For Devise and omniauth support ----------------------
    # per: https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
    def from_omniauth(auth)
      # where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      #  user.email = auth.info.email
      #  user.password = Devise.friendly_token[0, 20]
      #  user.name = auth.info.name
      #  # user.image = auth.info.image # assuming the user model has an image
      # end
      if (user = User.where(provider: auth.provider, uid: auth.uid).first).nil?
        # We have not authenticated this oauth user before.
        if (user = User.where(email: auth.info.email).first).nil?
          # We don't have this oauth user currently in our db. i.e. they haven't
          # logged in with username/password manually before.
          user = User.create(email: auth.info.email,
                             password: Devise.friendly_token[0, 20],
                             name: auth.info.name)
        end
        # We have the oauth user in our db, make sure provider, providerId,
        # name, email addr are all in our db.
        user.provider = auth.provider
        user.uid = auth.uid
        # auth.credentials[:token] =>
        # "xoxp-24589067905-24581533508-27512172705-2a6058043e"
        # auth.info.team => "Blocmetrics"
        # if @view.app.save
        #  # Response: tell browser to show this new registered site.
        #  redirect_to @view.app, notice: 'Site was saved successfully.'
        # else
        #  # Response: redisplay the edit form with error msgs.
        #  flash.now[:alert] = 'Error creating registered site. Please try again.'
        #  render :new
        # end
        user.save!
      end
      # Return authenticated oauth User
      user
    end
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
