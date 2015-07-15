class User
  attr_reader :name, :avatar, :email

  def initialize(auth_hash: nil, email: email, name: name)
    if email or name
      auth_hash = { info: { nickname: name, email: email } }
    end
    @name = auth_hash[:info][:nickname] || name
    @avatar = auth_hash[:info][:image]
    @email = auth_hash[:info][:email]
  end

  def avatar
    @avatar || "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(@email.downcase)}"
  end

  def to_s
    name
  end

end
