require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test "loads correctly" do
    # no setup

    # exercise
    visit "/"

    # save_and_open_screenshot
    # save_and_open_page
    # puts page.html --> not used often

    # verify
    assert_equal 200, page.status_code
    assert page.has_content?("Products")
    assert page.has_selector?('.product', count: Product.count)
    # no teardown
  end

  # def test_loads_correctly
    # visit "/"
    # assert_equal 200, page.status_code
    # assert page.has_content?("Products")
  # end
end
