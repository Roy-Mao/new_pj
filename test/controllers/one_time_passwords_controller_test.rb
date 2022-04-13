require "test_helper"

class OneTimePasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @one_time_password = one_time_passwords(:one)
  end

  test "should get index" do
    get one_time_passwords_url
    assert_response :success
  end

  test "should get new" do
    get new_one_time_password_url
    assert_response :success
  end

  test "should create one_time_password" do
    assert_difference("OneTimePassword.count") do
      post one_time_passwords_url, params: { one_time_password: {  } }
    end

    assert_redirected_to one_time_password_url(OneTimePassword.last)
  end

  test "should show one_time_password" do
    get one_time_password_url(@one_time_password)
    assert_response :success
  end

  test "should get edit" do
    get edit_one_time_password_url(@one_time_password)
    assert_response :success
  end

  test "should update one_time_password" do
    patch one_time_password_url(@one_time_password), params: { one_time_password: {  } }
    assert_redirected_to one_time_password_url(@one_time_password)
  end

  test "should destroy one_time_password" do
    assert_difference("OneTimePassword.count", -1) do
      delete one_time_password_url(@one_time_password)
    end

    assert_redirected_to one_time_passwords_url
  end
end
