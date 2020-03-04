# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
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
