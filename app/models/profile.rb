class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :articles, dependent: :destroy
  has_many :gifts, class_name: 'Gift', foreign_key: 'receiver_id'
  has_many :givers, through: :gifts, source: :giver
  has_many :relationships, class_name: 'Relationship', foreign_key: 'followed_id'
  has_many :followers, through: :relationships, source: :follower

  validates :user_id, uniqueness: true

  with_options presence: true do
    validates :image
    validates :name
    validates :store_name
    VALID_URL_REGEX = /\A#{URI::regexp(%w(http https))}\z/.freeze
    validates :store_url, format: { with: VALID_URL_REGEX }
    validates :text
  end
end 
