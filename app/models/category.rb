class Category < ApplicationRecord
  validates :name, presence: true, length: { in: 3...30 }, uniqueness: { case_sensitive: false }
end
