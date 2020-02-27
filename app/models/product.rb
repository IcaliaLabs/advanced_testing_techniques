class Product < ApplicationRecord
  enum status: {
    draft: 0,
    published: 1,
    cancelled: 2
  }

  validates :name,
            :description,
            :price, presence: true
end
