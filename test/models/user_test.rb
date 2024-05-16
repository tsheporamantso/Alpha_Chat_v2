require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(username: 'johndoe', email: 'john.doe@example.com', password: 'password')
  end

  test 'username should be unique and case sensitive' do
    @user.save
    @user2 = User.new(username: 'JohnDoe')
    assert_not @user2.valid?
  end

  test 'email should be unique and case insensitive' do
    @user.save
    @user2 = User.new(email: 'John.Doe@example.com')
    assert_not @user2.valid?
  end
end
