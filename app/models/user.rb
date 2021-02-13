class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :likes, dependent: :destroy
         
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } #Email大・小文字の区別なし、一意性
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX } # パスワード半角英数字
       
  def already_liked?(article)
    self.likes.exists?(article_id: article.id)
  end
end
