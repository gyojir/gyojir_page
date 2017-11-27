class Manga < ApplicationRecord
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  mount_uploader :image, ImageUploader
  validates :title, presence: true

  ORDERS = {
    '新しい順' => 'created_at desc',
    '古い順' => 'created_at asc'
  }
end
