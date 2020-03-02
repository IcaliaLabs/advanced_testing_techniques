# frozen_string_literal: true

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
      select Shop.first.name, from: :product_shop_id
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
