require 'test_helper'

class SiteAControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
