class CreateWinners < ActiveRecord::Migration[5.2]
  def change
    create_table :winners do |t|

      t.timestamps
    end
  end
end
