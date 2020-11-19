require "application_system_test_case"

class AngelsTest < ApplicationSystemTestCase

 test "lets a signed in user create a new product" do
    login_as users(:george)
    visit "/profile"
    fill_in "Angel name", with: "Angel George"
    save_and_open_screenshot
    fill_in "Phone number", with: "+393450847902"
    click_on 'Create Angel'
    save_and_open_screenshot
    # Should be redirected to Home with new product
    assert_equal profile_path, page.current_path
  end
end
