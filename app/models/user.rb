class User < ActiveRecord::Base
  has_many :favorites
  has_many :trucks, through: :favorites
  has_secure_password

  validates :password, length: { in: 8..24 }, allow_nil: true
  validates :first_name, :last_name, presence: true, length: { in: 1..64 }
  validates :email, presence: true, format: { with: /@{1}/ }, length: { minimum: 3 }, uniqueness: true

  before_create :generate_token

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def generate_token
    self.auth_token = SecureRandom.uuid + "-" +  Digest::MD5.hexdigest("#{email}")
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end
end
