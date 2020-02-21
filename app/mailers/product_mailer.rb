# frozen_string_literal: true

class ProductMailer < ApplicationMailer

  def review(user, product)
    @product = product

    mail to: 'no-reply@icalialabs.com',
         subject: "Please provide a review for #{product.name}"
  end
end
