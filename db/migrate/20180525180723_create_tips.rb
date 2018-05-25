class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.references :participant, index: true
      t.references :match, index: true
      
      t.integer :home_goals
      t.integer :away_goals

      t.timestamps
    end
  end
end
