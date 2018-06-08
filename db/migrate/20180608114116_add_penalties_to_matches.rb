class AddPenaltiesToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :home_penalties, :integer
    add_column :matches, :away_penalties, :integer
  end
end
