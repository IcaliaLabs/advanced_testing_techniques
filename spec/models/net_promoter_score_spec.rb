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
        net_promoter_score = create(:net_promoter_score, score: i)

        expect(net_promoter_score).to be_promoter
      end
    end

    it 'returns true when value is less than 10' do
      net_promoter_score = create(:net_promoter_score, score: 1)

      expect(net_promoter_score).not_to be_promoter
    end

    it 'returns false when value is greater 10' do
      net_promoter_score = build(:net_promoter_score, score: 11)

      expect(net_promoter_score).not_to be_promoter
    end
  end

  describe '#passive?' do
    it 'returns true when value is 7 or 8' do
      7.upto(8).each do |i|
        net_promoter_score = create(:net_promoter_score, score: i)

        expect(net_promoter_score).to be_passive
      end
    end

    it 'returns false if score is less than 7' do
      net_promoter_score = create(:net_promoter_score, score: 6)

      expect(net_promoter_score).not_to be_passive
    end

    it 'returns false if score is greater than 8' do
      net_promoter_score = create(:net_promoter_score, score: 9)

      expect(net_promoter_score).not_to be_passive
    end
  end

  describe '#dretractor?' do
    it 'returns true when value is less than 7' do
      0.upto(6).each do |i|
        net_promoter_score = create(:net_promoter_score, score: i)

        expect(net_promoter_score).to be_detractor
      end
    end

    it 'returns false if value is greater than 6' do
      7.upto(10).each do |i|
        net_promoter_score = create(:net_promoter_score, score: i)

        expect(net_promoter_score).not_to be_detractor
      end
    end

    it 'returns false if value is less than 0' do
      net_promoter_score = build(:net_promoter_score, score: -1)

      expect(net_promoter_score).not_to be_detractor
    end
  end

  describe '.promoter' do
    it 'includes records with scores within promoter range' do
      (9..10).each do |score|
        net_promoter_score = build :net_promoter_score, score: score
        expect(subject.promoter).to include(net_promoter_score)
      end
    end
  end
end
