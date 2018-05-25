class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.datetime :begins_at
      t.integer :away_goals
      t.integer :home_goals

      t.timestamps
    end
  end
end
