class Article < ApplicationRecord
  belongs_to :author

  validates :title, presence: true #  должно присутствовать значение title
  validates :body, presence: true, length: { minimum: 10 } # значение body также должно присутствовать и иметь длину мин 10
end
# миграции blog git add