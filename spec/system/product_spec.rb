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
      has_css?('p.product_title', text: "Draft - #{@name}")
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

  def create_product(product_name)
    visit new_product_path
    fill_in :product_name, with: product_name
    fill_in :product_description, with: 'description'
    fill_in :product_price, with: 500
    click_button 'Create'
  end

  context 'Product publication' do
    it 'cancels the product' do
      product_name = 'Nintendo Switch'
      create_product product_name

      click_button 'Publish'

      expect(page).to(
        have_css('p.product_title', text: "Published - #{product_name}")
      )
    end
  end
end
