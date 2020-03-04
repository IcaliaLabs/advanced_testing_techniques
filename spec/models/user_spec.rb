# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.recent' do
    it 'returns the users from newest to oldest' do
      user_1 = create(:user, created_at: 3.days.ago)
      user_2 = create(:user, created_at: 2.days.ago)
      user_3 = create(:user, created_at: 1.days.ago)

      users = User.recent

      expect(users).to eq [user_3, user_2, user_1]
    end
  end

  describe '#full_name' do

    it 'returns the first_name and last_name concatenaded' do
      user = create(:user, first_name: 'Naruto', last_name: 'Uzumaki')

      expect(user.full_name).to eq 'Naruto Uzumaki'
    end

    it 'returns only the first_name if no last_name is provided' do
      user = create(:user, first_name: 'Naruto', last_name: nil)

      expect(user.full_name).to eq 'Naruto'
    end
  end
end
