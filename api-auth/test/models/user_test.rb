require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "should save valid user" do
    assert @user.save
  end

  test "should not save user without email" do
    @user.email = nil
    assert_not @user.save
  end

  test "should not save user with invalid email" do
    @user.email = "invalid"
    assert_not @user.save
  end

  test "should not save user without password" do
    @user.password = nil
    assert_not @user.save
  end
end
