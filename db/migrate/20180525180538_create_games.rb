class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :user, index: true

      t.string :name
      t.integer :bet, null: false, default: 0
      t.integer :rule_match, null: false, default: 5
      t.integer :rule_goal_difference, null: false, default: 3
      t.integer :rule_tendency, null: false, default: 2
      t.integer :rule_miss, null: false, default: 0
      t.boolean :private, null: false, default: true

      t.timestamps
    end
  end
end
