# frozen_string_literal: true

class NetPromoterScore < ApplicationRecord
  validates :score, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }
end
