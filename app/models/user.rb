class User < ApplicationRecord
    validates :email, uniqueness: true, presence: true
    validates_presence_of :password
    before_save :keys
    has_secure_password
    # has_secure_token :api_keys

  def keys
   self.api_key = SecureRandom.hex
  end
end
