require 'test_helper'

class SubNavsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_nav = sub_navs(:one)
  end

  test "should get index" do
    get sub_navs_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_nav_url
    assert_response :success
  end

  test "should create sub_nav" do
    assert_difference('SubNav.count') do
      post sub_navs_url, params: { sub_nav: { nav: @sub_nav.nav, page: @sub_nav.page, title: @sub_nav.title } }
    end

    assert_redirected_to sub_nav_url(SubNav.last)
  end

  test "should show sub_nav" do
    get sub_nav_url(@sub_nav)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_nav_url(@sub_nav)
    assert_response :success
  end

  test "should update sub_nav" do
    patch sub_nav_url(@sub_nav), params: { sub_nav: { nav: @sub_nav.nav, page: @sub_nav.page, title: @sub_nav.title } }
    assert_redirected_to sub_nav_url(@sub_nav)
  end

  test "should destroy sub_nav" do
    assert_difference('SubNav.count', -1) do
      delete sub_nav_url(@sub_nav)
    end

    assert_redirected_to sub_navs_url
  end
end
