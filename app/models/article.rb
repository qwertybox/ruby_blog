class Article < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  after_initialize :init

  def init
    self.visits ||= 0
    self.likes ||= 0
  end

  def add_like
    self.likes += 1
    save!
  end

  def add_visit
    self.visits += 1
    save!
  end

  validates :title, presence: true #  должно присутствовать значение title
  validates :body, presence: true, length: { minimum: 10 } # значение body также должно присутствовать и иметь длину мин 10
end
# миграции blog git add