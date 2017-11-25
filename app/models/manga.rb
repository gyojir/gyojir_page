class Manga < ApplicationRecord
  has_many :tags, dependent: :destroy
  validates :title, presence: true
  validates :path, presence: true
end
