class Like < ApplicationRecord
  belongs_to :user
  belongs_to :profile

  validates_uniqueness_of :profile_id, scope: :user_id
end
