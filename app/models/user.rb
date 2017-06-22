class User < ActiveRecord::Base
  validates :username, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  def reset_session_token!
    self.session_token = SecureRandom.base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    current_user = User.find_by_username(username)
    return nil if current_user.nil?
    if current_user.is_password?(password)
      current_user
    else
      nil
    end
  end


  has_many :cats,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "Cat"

  has_many :cat_rental_requests,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: "CatRentalRequest"

end
