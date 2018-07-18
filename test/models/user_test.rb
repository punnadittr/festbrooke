require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not create empty user' do
    user = User.new
    assert_not user.save
  end
end
