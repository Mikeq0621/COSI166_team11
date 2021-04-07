require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'need to have name, email, phone number password to be valid' do
    # if not having all required validations
    user0 = User.new(name: 'mike')
    assert_not user0.valid?
    # Having no password
    user1 = User.new(name: 'mike', email: '123@123.com', phone_number: '123-123-1234')
    assert_not user1.valid?
    # Having all required fields, should be valid
    user2 = User.new(name: 'mike', email: '123@1233.com', phone_number: '123-123-1234', password: '123')
    assert user2.valid?
  end

  test "invalid if email does not have @" do
    # user1 with invalid email address
    user1 = User.new(name: 'mike', email: '123.123.com', phone_number: '123-123-1234', password: '123')
    assert_not user1.save
  end

  test 'valid if email has @' do
    user2 = User.new(name: 'mike', email: '22@22.com', phone_number: '123-123-1234', password: '123')
    assert user2.valid?
  end

  test 'invalid if name is longer than 50 chars' do
    # user1's name is longer than 50 chars
    user1 = User.new(name: 'mike'*20, email: '123@123.com', phone_number: '123-123-1234', password: '123')
    assert_not user1.valid?
    user2 = User.new(name: 'mike'*10, email: '123@123.com', phone_number: '123-123-1234', password: '123')
    assert user2.valid?
  end

  test 'invalid if a phone number is not a 10 digit number' do
    user1 = User.new(name: 'mike', email: 'mike@google.com', phone_number: '123', password: '123')
    assert_not user1.valid?
  end

  test 'valid phone number will be 10 digit could with -' do
    # user1 and user2 with different format of phone number, both are valid
    user1 = User.new(name: 'mike', email: 'valid@phone.com', phone_number: '1231231231', password: '123')
    user2 = User.new(name: 'mike', email: 'valid@phone.com', phone_number: '123-123-1231', password: '123')
    assert user1.valid?
    assert user2.valid?
  end

  test 'invalid with duplicated emails' do
    user1 = User.new(name: 'mike', email: 'duplicate@gmail.com', phone_number: '1231231231', password: '123')
    assert user1.save
    # user2 with the same email address as user1
    user2 = User.new(name: 'john', email: 'duplicate@gmail.com', phone_number: '1241241245', password: '123')
    assert_not user2.valid?
    assert_not user2.save
  end

end


