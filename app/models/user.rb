class User < ActiveRecord::Base
  has_many :restaurants, { foreign_key: :creator_id }
  has_many :reviews, { foreign_key: :author_id }
  has_many :reviewed_restaurants, { through: :reviews }

  validate :validate_password
  validates :username, :email, { presence: true, uniqueness: true }


  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(plain_text_password)
    self.password == plain_text_password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 4
      errors.add(:password, "must be 4 characters or more")
    end
  end


end
