class Article < ApplicationRecord
  belongs_to :profile
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :text
  end
end
