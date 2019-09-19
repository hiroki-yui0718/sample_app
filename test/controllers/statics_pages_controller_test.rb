require 'test_helper'

class StaticsPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get statics_pages_home_url
    assert_response :success
    assert_select "title","Home | Ruby on Rails Tutorial Sample App"
  end

  test "should get help" do
    get statics_pages_help_url
    assert_response :success
    assert_select "title","Help | Ruby on Rails Tutorial Sample App"
  end

end
