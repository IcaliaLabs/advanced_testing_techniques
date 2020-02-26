# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserRegistrationFlow', type: :system do
  it 'is succesful' do
    visit new_user_registration_path
    within('form') do
      fill_in 'Email', with: 'new_user@gmail.com'
      fill_in 'Password', with: '12345678'
      fill_in I18n.t('devise.registrations.form.fields.password_confirmation'), with: '12345678'
      click_on I18n.t('devise.registrations.form.actions.submit')
    end
    expect(page).to have_current_path root_path, ignore_query: true
  end

  it 'fails' do
    visit new_user_registration_path
    within('form') do
      fill_in 'Email', with: 'new_user@gmail.com'
      fill_in 'Password', with: '12345'
      fill_in I18n.t('devise.registrations.form.fields.password_confirmation'), with: '12345678'
      click_on I18n.t('devise.registrations.form.actions.submit')
    end
    expect(page).to have_content('Password is too short')
  end
end
