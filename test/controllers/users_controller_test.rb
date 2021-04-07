require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'can get users' do
    get users_path
    assert_response :success
  end
  
end
