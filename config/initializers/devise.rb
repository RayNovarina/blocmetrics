# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # Devise will use the `secret_key_base` on Rails 4+ applications as its
  # `secret_key`
  # by default. You can change it below and use your own secret key.
  # config.secret_key = 'c73798910cda5c6e31d2223162a81da1d08727056f8a304bbf1c9ee
  # f19014964b488bd42fd71f7102432c843d433f0e654f8d82517b2a7f380973717d7272952'

  # ==> Mailer Configuration
  # Configure the e-mail address which will be shown in Devise::Mailer,
  # note that it will be overwritten if you use your own mailer class
  # with default "from" parameter.
  config.mailer_sender = 'ray.novarina@wemeus.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'

  # ==> Configuration for any authentication mechanism
  # Configure which keys are used when authenticating a user. The default is
  # just :email. You can configure it to use [:username, :subdomain], so for
  # authenticating a user, both parameters are required. Remember that those
  # parameters are used only when authenticating and not when retrieving from
  # session. If you need permissions, you should implement that in a before
  # filter. You can also supply a hash where the value is a boolean determining
  # whether or not authentication should be aborted when the value is not
  # present.
  # config.authentication_keys = [:email]

  # Configure parameters from the request object used for authentication. Each
  # entry
  # given should be a request method and it will automatically be passed to the
  # find_for_authentication method and considered in your model lookup. For
  # instance, if you set :request_keys to [:subdomain], :subdomain will be used
  # on authentication. The same considerations mentioned for authentication_keys
  # also apply to request_keys.
  # config.request_keys = []

  # Configure which authentication keys should be case-insensitive.
  # These keys will be downcased upon creating or modifying a user and when used
  # to authenticate or find a user. Default is :email.
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  # These keys will have whitespace before and after removed upon creating or
  # modifying a user and when used to authenticate or find a user.
  # Default is :email.
  config.strip_whitespace_keys = [:email]

  # Tell if authentication through request.params is enabled. True by default.
  # It can be set to an array that will enable params authentication only for
  # the given strategies, for example,
  # `config.params_authenticatable = [:database]` will
  # enable it only for database (email + password) authentication.
  # config.params_authenticatable = true

  # Tell if authentication through HTTP Auth is enabled. False by default.
  # It can be set to an array that will enable http authentication only for the
  # given strategies, for example, `config.http_authenticatable = [:database]`
  # will enable it only for database authentication. The supported strategies
  # are:
  # :database = Support basic authentication with authentication key + password
  # config.http_authenticatable = false

  # If 401 status code should be returned for AJAX requests. True by default.
  # config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication. 'Application' by default.
  # config.http_authentication_realm = 'Application'

  # It will change confirmation, password recovery and other workflows
  # to behave the same regardless if the e-mail provided was right or wrong.
  # Does not affect registerable.
  # config.paranoid = true

  # By default Devise will store the user in session. You can skip storage for
  # particular strategies by setting this option.
  # Notice that if you are skipping storage for all authentication paths, you
  # may want to disable generating routes to Devise's sessions controller by
  # passing skip: :sessions to `devise_for` in your config/routes.rb
  config.skip_session_storage = [:http_auth]

  # By default, Devise cleans up the CSRF token on authentication to
  # avoid CSRF token fixation attacks. This means that, when using AJAX
  # requests for sign in and sign up, you need to get a new CSRF token
  # from the server. You can disable this option at your own risk.
  # config.clean_up_csrf_token_on_authentication = true

  # ==> Configuration for :database_authenticatable
  # For bcrypt, this is the cost for hashing the password and defaults to 10. If
  # using other encryptors, it sets how many times you want the password
  # re-encrypted.
  #
  # Limiting the stretches to just one in testing will increase the performance
  # of your test suite dramatically. However, it is STRONGLY RECOMMENDED to not
  # use a value less than 10 in other environments. Note that, for bcrypt (the
  # default encryptor), the cost increases exponentially with the number of
  # stretches (e.g. a value of 20 is already extremely slow: approx. 60 seconds
  # for 1 calculation).
  config.stretches = Rails.env.test? ? 1 : 10

  # Setup a pepper to generate the encrypted password.
  # config.pepper = 'a8f6c919c1e1c6d41a0a4b32b2a70123979b6842acee1d8a40babb9fad8
  # 3b2bd1a10b106ba28e8a37867c060d7681abe0c9e27cf52911b6dea39f68a41c66658'

  # Send a notification email when the user's password is changed
  # config.send_password_change_notification = false

  # ==> Configuration for :confirmable
  # A period that the user is allowed to access the website even without
  # confirming their account. For instance, if set to 2.days, the user will be
  # able to access the website for two days without confirming their account,
  # access will be blocked just in the third day. Default is 0.days, meaning
  # the user cannot access the website without confirming their account.
  config.allow_unconfirmed_access_for = nil # 7.days

  # A period that the user is allowed to confirm their account before their
  # token becomes invalid. For example, if set to 3.days, the user can confirm
  # their account within 3 days after the mail was sent, but on the fourth day
  # their account can't be confirmed with the token any more.
  # Default is nil, meaning there is no restriction on how long a user can take
  # before confirming their account.
  # config.confirm_within = 3.days

  # If true, requires any email changes to be confirmed (exactly the same way as
  # initial account confirmation) to be applied. Requires additional
  # unconfirmed_email db field (see migrations). Until confirmed, new email is
  # stored in unconfirmed_email column, and copied to email column on successful
  # confirmation.
  config.reconfirmable = false

  # Defines which key will be used when confirming an account
  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # The time the user will be remembered without asking for credentials again.
  # config.remember_for = 2.weeks

  # Invalidates all the remember me tokens when the user signs out.
  config.expire_all_remember_me_on_sign_out = true

  # If true, extends the user's remember period when remembered via cookie.
  # config.extend_remember_period = false

  # Options to be passed to the created cookie. For instance, you can set
  # secure: true in order to force SSL only cookies.
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  # Range for password length.
  config.password_length = 8..72

  # Email regex used to validate email formats. It simply asserts that
  # one (and only one) @ exists in the given string. This is mainly
  # to give user feedback and not to assert the e-mail validity.
  # config.email_regexp = /\A[^@]+@[^@]+\z/

  # ==> Configuration for :timeoutable
  # The time you want to timeout the user session without activity. After this
  # time the user will be asked for credentials again. Default is 30 minutes.
  # config.timeout_in = 30.minutes

  # ==> Configuration for :lockable
  # Defines which strategy will be used to lock an account.
  # :failed_attempts = Locks an account after a number of failed attempts to
  #                    sign in.
  # :none            = No lock strategy. You should handle locking by yourself.
  # config.lock_strategy = :failed_attempts

  # Defines which key will be used when locking and unlocking an account
  # config.unlock_keys = [:email]

  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time
  #          (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both

  # Number of authentication tries before locking an account if lock_strategy
  # is failed attempts.
  # config.maximum_attempts = 20

  # Time interval to unlock the account if :time is enabled as unlock_strategy.
  # config.unlock_in = 1.hour

  # Warn on the last attempt before the account is locked.
  # config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  #
  # Defines which key will be used when recovering the password for an account
  # config.reset_password_keys = [:email]

  # Time interval you can reset your password with a reset password key.
  # Don't put a too small interval or your users won't have the time to
  # change their passwords.
  config.reset_password_within = 48.hours

  # When set to false, does not sign a user in automatically after their
  # password is reset. Defaults to true, so a user is signed in automatically
  # after a reset.
  # config.sign_in_after_reset_password = true

  # ==> Configuration for :encryptable
  # Allow you to use another encryption algorithm besides bcrypt (default). You
  # can use :sha1, :sha512 or encryptors from others authentication tools as
  # :clearance_sha1, :authlogic_sha512 (then you should set stretches above to
  # 20 for default behavior) and :restful_authentication_sha1 (then you should
  # set stretches to 10, and copy
  # REST_AUTH_SITE_KEY to pepper).
  #
  # Require the `devise-encryptable` gem when using anything other than bcrypt
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # Turn scoped views on. Before rendering "sessions/new", it will first check
  # for "users/sessions/new". It's turned off by default because it's slower if
  # you are using only default views.
  # config.scoped_views = false

  # Configure the default scope given to Warden. By default it's the first
  # devise role declared in your routes (usually :user).
  # config.default_scope = :user

  # Set this configuration to false if you want /users/sign_out to sign out
  # only the current scope. By default, Devise signs out all scopes.
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # Lists the formats that should be treated as navigational. Formats like
  # :html, should redirect to the sign in page when the user does not have
  # access, but formats like :xml or :json, should return 401.
  #
  # If you have any extra navigational formats, like :iphone or :mobile, you
  # should add them to the navigational formats lists.
  #
  # The "*/*" below is required to match Internet Explorer requests.
  # config.navigational_formats = ['*/*', :html]

  # The default HTTP method used to sign out a resource. Default is :delete.
  config.sign_out_via = :delete

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # If you want to use other strategies, that are not supported by Devise, or
  # change the failure app, you can configure them inside the config.warden
  # block.
  #
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # ==> Mountable engine configurations
  # When using Devise inside an engine, let's call it `MyEngine`, and this
  # engine is mountable, there are some extra configurations to be taken into
  # account.
  # The following options are available, assuming the engine is mounted as:
  #
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine
  #
  # When using OmniAuth, Devise cannot automatically set OmniAuth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
  #
  # oauth - omniauth provider, AppId, AppSecret, CallbackUrl
  config.omniauth :slack,
                  '24589067905.25644845299',
                  '048cce3f02f8e529b29536c23b5c9521',
                  scope: 'incoming-webhook,commands,'\
                         'channels:write,channels:read,chat:write:user,'\
                         'files:write:user,files:read,team:read,users:read'
  config.omniauth :facebook, '1581359102184049',
                  'e658ffd848d6f71774c8ceab7bdc627d'
  # generate get authorize url as:
  # https://www.facebook.com/dialog/oauth
  # ?client_id=1581359102184049
  # &redirect_uri=http://localhost:3000/users/auth/facebook/callback
  # &response_type=code
  # &scope=email
  # &state=5afe06de71fd85ad846123a8535d10b9a92d23aa2e59a577
  # after dropping the callback_url param, facebook display permissin box,
  # i accepted and the url changed to:
  # http://localhost:3000/users/auth/facebook/callback
  # ?code=AQBd5YkHlgQzO7we2_tG4Ux0Pz7b09EH7v9O0FTlEu0mkrjYuA3vqcxWA5iRNXTTKWPy3OlhdovQWwpKpPbOYNAQToRpMUoOcjiuKgQK57A9yaM4BOx3dwEy9TihLNcKRyncCRD2rVOKDsqbVj_0FIKNzZe_ubKvkDPZUF6QeCEFg8OBQxtNgrDizYrALPvox4GXIQgr8yTfJZYT_rVGIe_Bm38EZU7Lt5HI0ey5cXpfROkuJiIiOUC_QZu-QI8Nht5OH65A7ZIQsbBkhHsBe3O-b4iBh63-jptcH0D1EdKPTXog9MqFhIfUchpe8etNOKcIQmUyNm3B-MfDXjxb0S8J
  # &state=4ee68406be55905f2f9ea10a155f69a96e0fbd431b4375b4#_=_
  # the url /user/auth/facebook is handled by /controllers/omniauth_callbacks_controller.rb
end
