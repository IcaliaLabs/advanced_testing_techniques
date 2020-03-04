# frozen_string_literal: true

class ShopIncinerator
  def initialize(shop)
    @shop = shop
  end

  def incinerate!
    cancel_subscriptions
    remove_products
    notify_members
  end

  private

  def cancel_subscription
    validate_current_subscriptions
    remove_billing_details
    remove_assets
  end

  def remove_products
    # ...
  end

  def notify_members
    # ...
  end

  def validate_current_subscriptions
    subscriptions.select { |subscription| subscription_incineratable?(subscription) }
  end

  def subscriptions
    @subscriptions ||= shop.subscriptions
  end

  def subscription_incineratable?(subscription)
    subscription.premium? &&
      subscription.paid? &&
      !subscription.pending_orders?
  end
end
