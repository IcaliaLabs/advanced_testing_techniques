# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do

  describe '#price_with_tax' do
    it 'returns the price plus the tax value on MX' do
      product = build_stubbed(:product)

      price_with_tax = product.price_with_tax

      expect(price_with_tax).to eq 116.0
    end
  end
end
