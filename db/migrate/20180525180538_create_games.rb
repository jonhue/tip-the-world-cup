class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :bet
      t.integer :rule_match
      t.integer :rule_goal_difference
      t.integer :rule_tendency
      t.integer :rule_miss
      t.boolean :private

      t.timestamps
    end
  end
end
