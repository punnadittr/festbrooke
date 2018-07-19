class CreateFriendRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friend_requests do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :accept

      t.timestamps
    end
  end
end
