require "test_helper"

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  # test "should get faq" do
  #   get static_page_faq_url
  #   assert_response :success
  # end
end
