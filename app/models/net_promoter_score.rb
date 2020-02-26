# frozen_string_literal: true

class NetPromoterScore < ApplicationRecord
  validates :score, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }

  def promoter?
    score >= 9 && score <= 10
  end

  def passive?
    score >= 7 && score <= 8
  end
end
