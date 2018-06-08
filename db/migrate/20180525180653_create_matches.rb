class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :home, index: true
      t.references :away, index: true

      t.integer :home_goals
      t.integer :away_goals
      t.integer :home_penalties
      t.integer :away_penalties
      t.boolean :finished, null: false, default: false
      t.datetime :begins_at

      t.timestamps
    end
  end
end
