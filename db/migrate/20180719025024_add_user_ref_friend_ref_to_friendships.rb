class AddUserRefFriendRefToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_reference :friendships, :user, foreign_key: true
    add_reference :friendships, :friend, index: true
  end
end
