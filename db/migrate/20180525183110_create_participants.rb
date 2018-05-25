class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :user, index: true
      t.references :game, index: true
      t.references :nation, index: true

      t.timestamps
    end
  end
end
