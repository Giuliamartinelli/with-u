require "application_system_test_case"

class AngelsTest < ApplicationSystemTestCase
 test "log in as user and create an angel" do
    login_as users(:george)
    visit "/profile"
    fill_in "Angel name", with: "Angel George"
    fill_in "Phone number", with: "+393450847902"
    click_on 'Create Angel'
    #save_and_open_screenshot
    # Should be redirected to Home with new product
    assert_equal profile_path, page.current_path
  end

  test "log in as user and edit an angel" do
    login_as users(:george)
    visit "/profile"
    fill_in "Angel name", with: "Angel to Edit"
    fill_in "Phone number", with: "+393450847902"
    click_on "Edit angel"
    fill_in "Angel name", with: "Angel Edit"
    fill_in "Phone number", with: "+393450847902"
    click_on 'Submit'
    save_and_open_screenshot
    # Should be redirected to Home with new product
    assert_equal profile_path, page.current_path
  end

  test "log in as user and delete an angel" do
    login_as users(:george)
    visit "/profile"
    fill_in "Angel name", with: "Angel George"
    fill_in "Phone number", with: "+393450847902"
    #save_and_open_screenshot
    click_on 'fa-trash-alt'
    save_and_open_screenshot
    # Should be redirected to Home with new product
    assert_equal profile_path, page.current_path
  end
end

#rails test:system
