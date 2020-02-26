# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserLogInFlow', type: :system do
  it 'is succesful' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '12345678'
      click_on I18n.t('devise.sessions.form.actions.submit')
    end
    expect(page).to have_current_path root_path, ignore_query: true
  end

  it 'fails' do
    user = FactoryBot.create(:user)
    visit new_user_session_path
    within('form') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '12345679'
      click_on('Log in')
    end
    expect(page).to have_content('Log in')
  end
end
