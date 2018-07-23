require 'test_helper'

class FriendRequestFlowsTest < ActionDispatch::IntegrationTest

  def setup
    @user1 = users(:user1)
    @user2 = users(:user2)
  end

  test "should be able to send friend request" do
    sign_in_as(@user1)
    visit user_path(@user2)
    assert_difference [ '@user1.sent_friend_requests.count', 
                        '@user2.received_friend_requests.count' ] do
      click_on "Add Friend"
    end
  end

  test "should be able to ignore friend request from other user" do
    sign_in_as(@user2)
    visit user_path(@user1)
    click_on "Add Friend"
    click_on "logout-button"
    sign_in_as(@user1)
    visit user_path(@user2)
    assert_difference [ '@user1.received_friend_requests.count',
                        '@user2.sent_friend_requests.count' ], -1 do
      click_on "Ignore Request"
    end
  end

  test "should be able to cancel sent requests" do
    sign_in_as(@user2)
    visit user_path(@user1)
    click_on "Add Friend"
    visit user_path(@user1)
    assert_difference [ "@user1.received_friend_requests.count",
                        '@user2.sent_friend_requests.count' ], -1 do
      click_on "Cancel Request" 
    end
  end
  
  test "should be able to accept friend requests" do
    sign_in_as(@user1)
    visit user_path(@user2)
    assert_difference [ '@user1.sent_friend_requests.count', 
                        '@user2.received_friend_requests.count' ] do
      click_on "Add Friend"
    end
    click_on "logout-button"
    sign_in_as(@user2)
    visit user_path(@user1)
    assert_difference [ '@user1.sent_friend_requests.count', 
                        '@user2.received_friend_requests.count'], -1 do
      assert_difference [ '@user1.friends.count', '@user2.friends.count' ], +1 do
        click_on "Accept Request"
      end
    end
  end

  test "unfriend button should appear for both parties" do
    sign_in_as(@user1)
    visit user_path(@user2)
    click_on "Add Friend"
    click_on "logout-button"
    sign_in_as(@user2)
    visit user_path(@user1)
    click_on "Accept Request"
    # Check unfriend button for user2
    visit user_path(@user1)
    find_button('Unfriend')
    click_on "logout-button"
    # Check unfriend button for user1
    sign_in_as(@user1)
    visit user_path(@user2)
    find_button('Unfriend')
  end

  test "should be able to unfriend" do
    sign_in_as(@user1)
    visit user_path(@user2)
    click_on "Add Friend"
    click_on "logout-button"
    sign_in_as(@user2)
    visit user_path(@user1)
    click_on "Accept Request"
    visit user_path(@user1)
    assert_difference [ '@user1.friends.count', '@user2.friends.count' ], -1 do
      click_on "Unfriend"
    end
  end
end