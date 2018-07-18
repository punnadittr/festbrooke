require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test 'should get signup path' do
    get new_user_registration_path
    assert_response :success
  end
end
