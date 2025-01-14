require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create a new user with valid token" do
    assert_difference("User.count") do
      post signup_url,
        params: {user: {email: @user.email, password: "password123"}},
        as: :json
    end

    data = response.parsed_body

    assert_response :created
    assert_equal @user.email, data.dig("user", "email")

    post login_url,
      headers: {Authorization: "Bearer #{data.dig("token")}"},
      as: :json

    data = response.parsed_body
  end
end
