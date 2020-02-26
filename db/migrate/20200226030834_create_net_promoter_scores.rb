class CreateNetPromoterScores < ActiveRecord::Migration[6.0]
  def change
    create_table :net_promoter_scores do |t|
      t.integer :score

      t.timestamps
    end
  end
end
