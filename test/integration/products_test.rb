require 'test_helper'

class ProductsTest < ActionDispatch::IntegrationTest
  test "lets a signed in user create a new product" do
    # no setup (setup is done with fixture)

    # exercise
    login_as users(:george)
    visit "/products/new"

    fill_in "product_name", with: "Le Wagon"
    fill_in "product_tagline", with: "Change your life: Learn to code"
    click_button 'Create Product'

    # verify
    # save_and_open_screenshot    
    assert_equal 200, page.status_code
    # Should be redirected to Home with new product
    assert_equal root_path, page.current_path
    assert page.has_content?("Le Wagon")
    assert page.has_content?("Change your life: Learn to code")

    # no teardown
  end
end
