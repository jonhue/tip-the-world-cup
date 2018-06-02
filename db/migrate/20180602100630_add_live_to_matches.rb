class AddLiveToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :live, :boolean, null: false, default: false
  end
end
