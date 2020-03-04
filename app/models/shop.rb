class Shop < ApplicationRecord
  belongs_to :user
  has_many :products

  def subscribe
    # something cool on subscriptions and
    # plans should happen here
  end

  def premium?
    true
  end
end
