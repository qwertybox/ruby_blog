class Author < ApplicationRecord
  has_many :articles
  # belongs_to :user
  validates :name, presence: true
  validates :bio, presence: false #  length: { minimum: 10 } if in validates with method
end
