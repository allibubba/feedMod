require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get pull" do
    get :pull
    assert_response :success
  end
end
