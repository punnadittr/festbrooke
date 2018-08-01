require 'test_helper'

class PublishingPostTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:user1)
    @user = users(:user1)
    attach_pic(@user)
  end
  
  test "should be able to write a post with only text" do
    visit user_path(@user)
    fill_in('post_content', with: 'lorem ipsum')
    assert_difference '@user.posts.count' do 
      click_on('Post')
    end
    assert current_path == user_path(@user)
  end

  test "should not be able to publish empty posts" do
    visit user_path(@user)
    assert_no_difference '@user.posts.count' do 
      click_on('Post')
    end
    assert current_path == user_path(@user)
  end
end
