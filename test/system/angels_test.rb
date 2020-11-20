require "application_system_test_case"

class AngelsTest < ApplicationSystemTestCase
 # test "log in as user and create an angel" do
 #    login_as users(:george)
 #    visit "/profile"
 #    fill_in "Angel name", with: "Angel George"
 #    fill_in "Phone number", with: "+393450847902"
 #    click_on 'Create Angel'
 #    #save_and_open_screenshot
 #    # Should be redirected to Home with new product
 #    assert_equal profile_path, page.current_path
 #      test "edit an angel" do
 #        page.all('.fa-pencil-alt')[0].click
 #        save_and_open_screenshot
 #        fill_in "Angel name", with: "Angel 2"
 #        fill_in "Phone number", with: "+393450847902"
 #        save_and_open_screenshot
 #        click_on 'Submit'
 #        save_and_open_screenshot
 #      end
 #  end

  test "log in as user and edit an angel" do
    login_as users(:george)
    visit "/profile"
    fill_in "Angel name", with: "Angel 1"
    fill_in "Phone number", with: "+393450847902"
    click_on 'Create Angel'
    assert_equal profile_path, page.current_path
    #find('.edit-angel').click
    first('.edit-angel').click
    fill_in "Name", with: "Angel 2"
    fill_in "Phone number", with: "+393450847902"
    click_on 'Submit'
    sleep 1
    assert_equal profile_path, page.current_path
  end

  # test "log in as user and delete an angel" do
  #   login_as users(:george)
  #   visit "/profile"
  #   fill_in "Angel name", with: "Angel George"
  #   fill_in "Phone number", with: "+393450847902"
  #   #save_and_open_screenshot
  #   click_on 'fa-trash-alt'
  #   save_and_open_screenshot
  #   # Should be redirected to Home with new product
  #   assert_equal profile_path, page.current_path
  # end
end

#rails test:system
