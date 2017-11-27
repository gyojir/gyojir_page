class Manga < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :votes, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  mount_uploader :image, ImageUploader
  validates :title, presence: true

  ORDERS = {
    '新しい順' => 'created_at desc',
    '古い順' => 'created_at asc'
  }

  # 漫画に対してuser_idが既にvoteしているか
  def vote_user(user_id)
    votes.find_by(user_id: user_id, manga_id: self.id)
  end
end
