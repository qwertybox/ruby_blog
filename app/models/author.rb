class Author < ApplicationRecord
  has_many :articles

  validates :name, presence: true
  validates :bio, presence: false, length: { minimum: 10 }
end
