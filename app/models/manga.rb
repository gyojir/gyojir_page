class Manga < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :votes, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  mount_uploader :image, ImageUploader
  validates :title, presence: true

  ORDERS = {
    '新しい順' => 'created_at desc',
    '古い順' => 'created_at asc',
    '面白い順' => 'good desc',
    '面白くない順' => 'good asc',
    'つまらない順' => 'bad desc',
    'つまらなくない順' => 'bad asc',
  }

  # user_idが漫画に対して既にしているvote
  def user_vote(user_id)
    votes.find_by(user_id: user_id)
  end
end
