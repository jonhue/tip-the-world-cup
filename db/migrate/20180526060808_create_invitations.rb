class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.references :game, index: true
      t.references :user, index: true

      t.string :email, index: true
      t.boolean :accepted, null: false, default: false
      t.text :message

      t.timestamps
    end
  end
end
