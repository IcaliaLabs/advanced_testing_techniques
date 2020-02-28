# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Product', type: :system do
  context 'Product creation' do
    it 'creates the product' do
      product_name = 'Xbox One'
      page_product = Page::Product.new(product_name)
      page_product.create

      expect(page_product).to exist
    end
  end

  context 'Product publication' do
    it 'publishes the product' do
      product_name = 'Nintendo Switch'
      page_product = Page::Product.new(product_name)
      page_product.create

      page_product.publish

      expect(page_product).to be_published
    end
  end
end
