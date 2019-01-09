require 'test_helper'

class NavsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nav = navs(:one)
  end

  test "should get index" do
    get navs_url
    assert_response :success
  end

  test "should get new" do
    get new_nav_url
    assert_response :success
  end

  test "should create nav" do
    assert_difference('Nav.count') do
      post navs_url, params: { nav: { link: @nav.link, title: @nav.title } }
    end

    assert_redirected_to nav_url(Nav.last)
  end

  test "should show nav" do
    get nav_url(@nav)
    assert_response :success
  end

  test "should get edit" do
    get edit_nav_url(@nav)
    assert_response :success
  end

  test "should update nav" do
    patch nav_url(@nav), params: { nav: { link: @nav.link, title: @nav.title } }
    assert_redirected_to nav_url(@nav)
  end

  test "should destroy nav" do
    assert_difference('Nav.count', -1) do
      delete nav_url(@nav)
    end

    assert_redirected_to navs_url
  end
end
