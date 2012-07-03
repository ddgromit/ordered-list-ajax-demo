require 'test_helper'

class DemoControllerTest < ActionController::TestCase
  test "should get ordering" do
    get :ordering
    assert_response :success
  end

end
