class User < ActiveRecord::Base
  has_many :posts
  ## we register an inline callback directly after the before_save callback
  before_save { self.email = email.downcase if email.present? }
  # # we use Ruby's validates function to ensure that name is present and has a maximum and minimum length
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  # # we validate password with two separate validations
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  # # we validate that email is present, unique, case insensitive, has a minimum length, has a maximum length, and that it is a properly formatted email address
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }
  # # we use Ruby's has_secure_password
  has_secure_password

end
