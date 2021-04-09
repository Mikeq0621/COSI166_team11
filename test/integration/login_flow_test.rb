require "test_helper"

class LoginFlowTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:mike)
    @listing = listings(:one)
  end

  test 'user can create account' do
    # sign_up page
    get new_user_url
    assert_response :success
    # submit form
    post users_url,
      params: { user: { name: "IntegrationTest", email: "itest@test.com", password: '123', phone_number: '123-123-1234' } }
    assert_response :redirect
    # Redirecting to home page
    follow_redirect!
    assert_response :success
  end

  test 'user can view hosts, transactions, user_page' do
    get users_url
    assert_response :success
    get hosts_url
    assert_response :success
    # TODO: need testing signin to implement with authorization
    # get user_url(@user)
    # assert_response :success
  end

  test 'user can create a transaction' do
    c_user = users(:mike)
    c_listing = listings(:one)

    get new_transaction_url
    assert_response :success
    # FIXME: Need authroization to implement adding transaction, adding listings
  end
end
