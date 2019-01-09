require 'test_helper'

class GrandparentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grandparent = grandparents(:one)
  end

  test "should get index" do
    get grandparents_url
    assert_response :success
  end

  test "should get new" do
    get new_grandparent_url
    assert_response :success
  end

  test "should create grandparent" do
    assert_difference('Grandparent.count') do
      post grandparents_url, params: { grandparent: { child_id: @grandparent.child_id, course_id: @grandparent.course_id, first_name: @grandparent.first_name, last_name: @grandparent.last_name, member_id: @grandparent.member_id } }
    end

    assert_redirected_to grandparent_url(Grandparent.last)
  end

  test "should show grandparent" do
    get grandparent_url(@grandparent)
    assert_response :success
  end

  test "should get edit" do
    get edit_grandparent_url(@grandparent)
    assert_response :success
  end

  test "should update grandparent" do
    patch grandparent_url(@grandparent), params: { grandparent: { child_id: @grandparent.child_id, course_id: @grandparent.course_id, first_name: @grandparent.first_name, last_name: @grandparent.last_name, member_id: @grandparent.member_id } }
    assert_redirected_to grandparent_url(@grandparent)
  end

  test "should destroy grandparent" do
    assert_difference('Grandparent.count', -1) do
      delete grandparent_url(@grandparent)
    end

    assert_redirected_to grandparents_url
  end
end
