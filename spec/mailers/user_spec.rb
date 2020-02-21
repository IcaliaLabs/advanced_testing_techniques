# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let(:user) { create(:user) }

  describe 'nps' do
    let(:mail) { described_class.nps(user) }

    it 'sets the correct subject' do
      expect(mail.subject).to eq('Do you have 60 seconds for a quick question?')
    end

    it 'has the correct user to header' do
      expect(mail.to).to eq([user.email])
    end
  end
end
