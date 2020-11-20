require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "log in as user" do
  #   visit users_url
  #
  #   assert_selector "h1", text: "User"
  end

  test "log in as user and click on remember me" do
    login_as users(:george)
  #
  #   assert_selector "h1", text: "User"
  end

  test "sign up as user with correct credentials" do
    visit "/"
    click_on 'Sign up'
    fill_in "Name", with: "Marco"
    fill_in "Phone number", with: "+123123123123"
    fill_in "Email", with: "marc2o@gmail.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on 'Sign up'
    assert_equal profile_path, page.current_path
  end

  test "sign up as user with wrong phone number" do
    visit "/"
    click_on 'Sign up'
    fill_in "Name", with: "Marco"
    fill_in "Phone number", with: "12345"
    fill_in "Email", with: "marc2o@george.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on 'Sign up'
    assert_equal "/users", page.current_path
  end

  test "sign up as user with wrong email" do
    visit "/"
    click_on 'Sign up'
    fill_in "Name", with: "Marco"
    fill_in "Phone number", with: "+123123123123"
    fill_in "Email", with: "marc2o@g.com"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    click_on 'Sign up'
    assert_equal "/users", page.current_path
  end

  test "edit info as user" do
    login_as users(:george)
    visit "/profile"
    first('.edit-user-test').click
    save_and_open_screenshot
    fill_in "user_name", with: "Angel 2"
    fill_in "phone_number", with: "+393450847902"
    click_on 'Update'
    sleep 1
    assert_equal profile_path, page.current_path
  end

  test "log out as user" do
    login_as users(:george)
    visit "/profile"
    first('.btn-log-out').click
    click_on "OK"
    sleep 1
    assert_equal profile_path, page.current_path
  end
end
#rails test:system
