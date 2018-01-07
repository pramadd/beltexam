class User < ActiveRecord::Base
  has_secure_password

  # has_many :secrets
  # has_many :likes, dependent: :destroy
  # has_many :secrets_liked, through: :likes, source: :secret

  has_many :ideas
  has_many :likes,dependent: :destroy
  has_many :ideas_liked, through: :likes, source: :idea


  #validations
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  #validating name,alias
  validates :name, :alias, presence: true, length: { minimum: 3}
  #validates email
  validates :email,presence: true, uniqueness: { case_sensitive: false }, format: {with: EMAIL_REGEX}

  #validates password (must be 8 characters)
  validates :password,presence: true, length: {minimum: 8}, on: :create

  # before_save :downcase_email
  
  # def downcase_email
  #   self.email.downcase!
  # end

end
