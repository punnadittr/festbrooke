require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:user1)
  end

  test 'should allow text only post' do
    post = @user.posts.build(content: 'hello')
    assert post.valid?
  end

  test 'should associate with likes' do
    post = @user.posts.build(content: 'hello')
    assert_not post.likes.nil?
  end
end
