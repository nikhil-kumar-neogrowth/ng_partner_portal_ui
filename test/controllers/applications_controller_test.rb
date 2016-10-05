require 'test_helper'

class ApplicationsControllerTest < ActionController::TestCase
  test "should get applicationdetails" do
    get :applicationdetails
    assert_response :success
  end

end
