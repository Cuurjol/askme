require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions, dependent: :destroy
  has_many :asked_questions, class_name: 'Question', foreign_key: 'author_id', dependent: :nullify
  has_many :likes, dependent: :destroy

  validates :username, presence: true, uniqueness: true, length: { maximum: 40 }, format: { with: /\A[0-9a-z_]+\z/i }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i}
  validates :avatar_bg_color, :avatar_border_color, :profile_text_color, format: { with: /\A#[\h]{6}\z/ }, allow_nil: true

  # Второй способ валидации почты пользователя с помощью gem email_address
  # https://github.com/afair/email_address
  # validates_with EmailAddress::ActiveRecordValidator, field: :email

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_validation :check_username
  before_save :encrypt_password

  def to_param
    username
  end

  def check_username
    self.username = username.downcase if username.present?
  end

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    return user if user.password_hash == hashed_password

    nil
  end
end
