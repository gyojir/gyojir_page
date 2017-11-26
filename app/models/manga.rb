class Manga < ApplicationRecord
  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true
  mount_uploader :image, ImageUploader
  validates :title, presence: true
end
