class User < ActiveRecord::Base
  validates :token, presence: true
  validates :name, presence: true
  validates :email, presence: true

  def auth_hash=(auth_hash)
    self.name = auth_hash[:info][:nickname]
    self.avatar = auth_hash[:info][:image]
    self.email = auth_hash[:info][:email]
    self.token = auth_hash.credentials.token
  end

  def avatar_image
    avatar || "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(@email.downcase)}"
  end

  def to_s
    name
  end

end
