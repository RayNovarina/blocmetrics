#
class User < ActiveRecord::Base
  has_many :registered_applications, dependent: :destroy

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :slack]

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  # CLASS and Instance methods that extend the User ActiveRecord class via
  # /models/concerns files. And add useful helper routines and to put biz logic
  # in the model and not in controllers.
  include UserExtensions # /models/concerns/user_extensions.rb
end
