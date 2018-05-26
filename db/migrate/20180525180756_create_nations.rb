class CreateNations < ActiveRecord::Migration[5.2]
  def change
    create_table :nations do |t|
      t.string :slug, unique: true, index: true
      t.string :name

      t.timestamps
    end
  end
end
