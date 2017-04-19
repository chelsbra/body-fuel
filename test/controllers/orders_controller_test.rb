require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get submit" do
    get orders_submit_url
    assert_response :success
  end

end
