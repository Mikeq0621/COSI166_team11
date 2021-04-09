require "test_helper"

class HostTest < ActiveSupport::TestCase
  # Since Host account is similar with User, Test for host is reduced to minimal amount. 
  # If All User tests passed, host should act likewise.
  test 'need to have name, email, phone number password to be valid' do
    # if not having all required validations
    host0 = Host.new(name: 'mike')
    assert_not host0.valid?
    # Having no password
    host1 = Host.new(name: 'mike', email: '123@123.com', phone_number: '123-123-1234')
    assert_not host1.valid?
    # Having all required fields, should be valid
    host2 = Host.new(name: 'mike', email: '123@1233.com', phone_number: '123-123-1234', password: '123')
    assert host2.valid?
  end

  test "invalid if email does not have @" do
    # user1 with invalid email address
    host1 = Host.new(name: 'mike', email: '123.123.com', phone_number: '123-123-1234', password: '123')
    assert_not host1.save
  end

  test 'invalid if a phone number is not a 10 digit number' do
    host1 = Host.new(name: 'mike', email: 'mike@google.com', phone_number: '123', password: '123')
    assert_not host1.valid?
  end

  test 'invalid with duplicated emails' do
    host1 = Host.new(name: 'mike', email: 'duplicate@gmail.com', phone_number: '1231231231', password: '123')
    assert host1.save
    # user2 with the same email address as user1
    host2 = Host.new(name: 'john', email: 'duplicate@gmail.com', phone_number: '1241241245', password: '123')
    assert_not host2.valid?
    assert_not host2.save
  end

end
