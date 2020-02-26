require 'rails_helper'

RSpec.describe NetPromoterScore, type: :model do
  it do
    expect(subject).to validate_numericality_of(:score)
      .is_greater_than_or_equal_to(0)
      .is_less_than_or_equal_to(10)
  end
end
