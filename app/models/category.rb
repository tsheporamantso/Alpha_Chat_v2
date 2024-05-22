class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 3...30 }, uniqueness: { case_sensitive: false }
  has_many :article_categories
  has_many :articles, through: :article_categories
end
