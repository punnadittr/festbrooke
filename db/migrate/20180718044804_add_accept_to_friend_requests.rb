class AddAcceptToFriendRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :friend_requests, :accept, :boolean
  end
end
