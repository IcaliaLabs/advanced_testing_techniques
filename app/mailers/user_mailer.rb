# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.nps.subject
  #
  def nps(user)
    @user = user

    mail to: @user.email,
         subject: t('user_mailer.nps.subject')
  end
end
