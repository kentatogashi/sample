class User < ActiveRecord::Base
  validates_uniqueness_of [:name, :email], :message => 'Inserted string is not uniqueness'
  validates :name, :presence => true
  validates :email, :presence => true

  before_save { self.name = name }
  before_create :create_remember_token
  has_secure_password

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private
    def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
    end
end
