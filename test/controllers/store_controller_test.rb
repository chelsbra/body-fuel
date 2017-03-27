require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get store_search_url
    assert_response :success
  end

  test "should get search_results" do
    get store_search_results_url
    assert_response :success
  end

end
