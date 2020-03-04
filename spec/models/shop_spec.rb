require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#subscribe' do

    it 'subscribes to a payment plan' do
      shop = create(:shop)

      shop.subscribe

      expect(shop).to be_premium
    end
  end

  describe '#unsubscribe' do
    it 'unsubscribes from a payment plan' do
    end
  end
end
