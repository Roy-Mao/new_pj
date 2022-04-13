require "application_system_test_case"

class OneTimePasswordsTest < ApplicationSystemTestCase
  setup do
    @one_time_password = one_time_passwords(:one)
  end

  test "visiting the index" do
    visit one_time_passwords_url
    assert_selector "h1", text: "One time passwords"
  end

  test "should create one time password" do
    visit one_time_passwords_url
    click_on "New one time password"

    click_on "Create One time password"

    assert_text "One time password was successfully created"
    click_on "Back"
  end

  test "should update One time password" do
    visit one_time_password_url(@one_time_password)
    click_on "Edit this one time password", match: :first

    click_on "Update One time password"

    assert_text "One time password was successfully updated"
    click_on "Back"
  end

  test "should destroy One time password" do
    visit one_time_password_url(@one_time_password)
    click_on "Destroy this one time password", match: :first

    assert_text "One time password was successfully destroyed"
  end
end
