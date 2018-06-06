class AddFinishedToMatches < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :finished, :boolean, null: false, default: false
    remove_column :matches, :live
  end
end
