require 'test_helper'

class LikingPostsTest < ActionDispatch::IntegrationTest
  def setup
    @user1 = users(:user1)
    @user2 = users(:user2)
  end

  # Not testing AJAX button
  test 'should be able to like and unlike posts properly' do
    # Other posts
    @user2.posts.create!(content: 'sample post')
    sign_in_as(@user1)
    visit user_path(@user2)
    assert_difference [ '@user1.likes.count', '@user2.posts.first.likes.count' ], 1 do
      click_on 'Like'
    end
    visit user_path(@user2)
    assert_difference [ '@user1.likes.count', '@user2.posts.first.likes.count' ], -1 do
      click_on 'Unlike'
    end
    click_on "logout-button"
    # Own posts
    sign_in_as(@user2)
    visit user_path(@user2)
    assert_difference [ '@user2.likes.count', '@user2.posts.first.likes.count' ], 1 do
      click_on 'Like'
    end
    visit user_path(@user2)
    assert_difference [ '@user2.likes.count', '@user2.posts.first.likes.count' ], -1 do
      click_on 'Unlike'
    end
  end
end
