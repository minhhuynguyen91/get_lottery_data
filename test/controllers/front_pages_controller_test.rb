require 'test_helper'

class FrontPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get front_pages_home_url
    assert_response :success
  end

end
