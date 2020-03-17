# frozen_string_literal: true

class NetPromoterScore < ApplicationRecord
  PROMOTER_RANGE = (9..10).freeze
  PASSIVE_RANGE = (7..8).freeze
  DETRACTOR_RANGE = (0..6).freeze

  scope :promoter, ->{where score: PROMOTER_RANGE}

  validates :score, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }

  def promoter?
    PROMOTER_RANGE.cover? score
    # score >= 9 && score <= 10
  end

  def passive?
    PASSIVE_RANGE.cover? score
    # score >= 7 && score <= 8
  end

  def detractor?
    DETRACTOR_RANGE.cover? score
    # score <= 6 && score >= 0
  end
end
