require 'test_helper'

class PortfolioControllerTest < ActionController::TestCase
  test "should get report1" do
    get :report1
    assert_response :success
  end

  test "should get report2" do
    get :report2
    assert_response :success
  end

  test "should get report3" do
    get :report3
    assert_response :success
  end

end
