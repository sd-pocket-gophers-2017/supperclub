class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.integer :event_id, null: false
      t.integer :guest_id, null: false
      t.string :accepted,

      t.timestamps
    end
  end
end
