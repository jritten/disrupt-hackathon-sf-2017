class Volunteer < ActiveRecord::Base
  has_many :gigs
  has_many :kids, { through: :gigs }
  has_many :parents, { through: :kids }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    if self.password == password
      return self
    else
      nil
    end
  end

  private

  def has_password
    if self.password == ""
      errors.add(:password, 'can\'t be empty')
    end
  end
end
end
