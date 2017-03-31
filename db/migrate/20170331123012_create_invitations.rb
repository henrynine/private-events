class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.string :status
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
