# frozen_string_literal: true

require 'rails_helper'

module Page
  class Product
    include Rails.application.routes.url_helpers
    include Capybara::DSL

    def initialize(name)
      @name = name
    end

    def create
      visit new_product_path
      fill_in :product_name, with: @name 
      fill_in :product_description, with: 'description'
      fill_in :product_price, with: 500
      click_button 'Create'
    end

    def exists?
      product_title.has_text? "Draft - #{@name}"
    end

    def publish
      click_button 'Publish'
    end

    def published?
      product_title.has_text? "Published - #{@name}"
    end

    private
    
    def product_title
      find('p.product_title')
    end
  end
end

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
