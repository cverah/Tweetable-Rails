class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  before_create :default_avatar
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :avatar

  # validates
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_blank: true
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  # validates :password, length: { minimum: 6 }

  # enums
  enum :role, { member: 0, admin: 1 }

  def self.from_omniauth(auth_hash)
    where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create do |user|
      # puts "HOLAAAAAAA"
      # p auth_hash
      user.provider = auth_hash.provider
      user.uid = auth_hash.uid
      user.username = auth_hash.info.nickname
      user.name = auth_hash.info.name
      user.email = auth_hash.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end 

  private
  def default_avatar
    # si hay avatar retorna
    return if avatar.attached?
    # si no hay avatar asigna
    avatar.attach(io: File.open("app/assets/images/default_avatar.png"), filename: "default_avatar.png")
  end
end
