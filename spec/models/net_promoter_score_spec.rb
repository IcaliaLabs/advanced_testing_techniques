require 'rails_helper'

RSpec.describe NetPromoterScore, type: :model do
  it do
    expect(subject).to validate_numericality_of(:score)
      .is_greater_than_or_equal_to(0)
      .is_less_than_or_equal_to(10)
  end

  describe '#promoter?' do
    it 'returns true when value is 9 or 10' do
      9.upto(10).each do |i|
        net_promoter_score = build(:net_promoter_score, score: i) 

        expect(net_promoter_score).to be_promoter
      end
    end

    it 'returns true when value is less than 10' do
      net_promoter_score = build(:net_promoter_score, score: 1)

      expect(net_promoter_score).not_to be_promoter
    end

    it 'returns false when value is greater 10' do
      net_promoter_score = build(:net_promoter_score, score: 11)

      expect(net_promoter_score).not_to be_promoter
    end
  end
end
