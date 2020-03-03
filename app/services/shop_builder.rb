# frozen_string_literal: true

class ShopBuilder
  def initialize(user)
    @user = user
  end

  def build
    if @user.shop_ready?
      # charge_user!
    end
  end

  private

  def charge_user!
    # ...
  end
end
