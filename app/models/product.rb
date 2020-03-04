# frozen_string_literal: true

class Product < ApplicationRecord
  TAX = 0.16

  enum status: {
    draft: 0,
    published: 1,
    cancelled: 2
  }

  validates :name,
            :description,
            :price, presence: true

  belongs_to :shop

  def price_with_tax
    price + (price * TAX)
  end
end
