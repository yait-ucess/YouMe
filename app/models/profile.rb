class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :user_id, uniqueness: true

  with_options presence: true do
    validates :name
    validates :store_name
    validates :store_url
    validates :text
  end
end
