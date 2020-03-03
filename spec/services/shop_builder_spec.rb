# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShopBuilder do
  describe '#build' do
    # https://relishapp.com/rspec/rspec-mocks/docs/basics/test-doubles
    it 'builds the shop for valid users' do
      user = instance_double(User, shop_ready?: true)

      ShopBuilder.new(user).build

      # here will come the expectation
    end
  end
end
