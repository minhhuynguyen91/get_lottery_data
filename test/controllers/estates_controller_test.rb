require 'test_helper'

class EstatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estate = estates(:one)
  end

  test "should get index" do
    get estates_url
    assert_response :success
  end

  test "should get new" do
    get new_estate_url
    assert_response :success
  end

  test "should create estate" do
    assert_difference('Estate.count') do
      post estates_url, params: { estate: { address: @estate.address, email: @estate.email, latitude: @estate.latitude, longitude: @estate.longitude, name: @estate.name, number: @estate.number, price: @estate.price, size: @estate.size, url: @estate.url } }
    end

    assert_redirected_to estate_url(Estate.last)
  end

  test "should show estate" do
    get estate_url(@estate)
    assert_response :success
  end

  test "should get edit" do
    get edit_estate_url(@estate)
    assert_response :success
  end

  test "should update estate" do
    patch estate_url(@estate), params: { estate: { address: @estate.address, email: @estate.email, latitude: @estate.latitude, longitude: @estate.longitude, name: @estate.name, number: @estate.number, price: @estate.price, size: @estate.size, url: @estate.url } }
    assert_redirected_to estate_url(@estate)
  end

  test "should destroy estate" do
    assert_difference('Estate.count', -1) do
      delete estate_url(@estate)
    end

    assert_redirected_to estates_url
  end
end
