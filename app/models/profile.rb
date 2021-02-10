class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :articles, dependent: :destroy
  has_many :likes, dependent: :destroy

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
