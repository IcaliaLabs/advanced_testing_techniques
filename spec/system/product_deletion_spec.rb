# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ProductDeletion', type: :system do
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
  end

  it 'deletes the product' do
    admin = create(:user, :as_admin)
    product = create(:product)

    sign_in admin
    visit product_path(product)
    click_link 'Destroy'


    expect(page).to have_text('Product was successfully destroyed.')
  end

  describe 'regular users' do
    it 'will not see the destroy link' do
      user = create(:user)
      product = create(:product)

      sign_in user
      visit product_path(product)

      expect(page).not_to have_text('Destroy')
    end
  end
end
