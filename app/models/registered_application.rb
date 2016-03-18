#
class RegisteredApplication < ActiveRecord::Base
  has_many :events, dependent: :destroy
  belongs_to :user

  validates :name, length: { minimum: 2 }, presence: true
  # Note: our form entry logic will prepend upto 11 chars
  # to the entered url, so the first 11 are a given,
  # i.e.'http://wwww.<userEntry>'
  validates :url, length:  { minimum: 11 + 8 }, presence: true
end
