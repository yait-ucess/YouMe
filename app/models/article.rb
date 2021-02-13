class Article < ApplicationRecord
  belongs_to :profile
  has_one_attached :image
  has_many :likes, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :title
    validates :text
  end
end
