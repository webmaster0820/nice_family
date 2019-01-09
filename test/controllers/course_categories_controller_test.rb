require 'test_helper'

class CourseCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_category = course_categories(:one)
  end

  test "should get index" do
    get course_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_course_category_url
    assert_response :success
  end

  test "should create course_category" do
    assert_difference('CourseCategory.count') do
      post course_categories_url, params: { course_category: { name: @course_category.name } }
    end

    assert_redirected_to course_category_url(CourseCategory.last)
  end

  test "should show course_category" do
    get course_category_url(@course_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_category_url(@course_category)
    assert_response :success
  end

  test "should update course_category" do
    patch course_category_url(@course_category), params: { course_category: { name: @course_category.name } }
    assert_redirected_to course_category_url(@course_category)
  end

  test "should destroy course_category" do
    assert_difference('CourseCategory.count', -1) do
      delete course_category_url(@course_category)
    end

    assert_redirected_to course_categories_url
  end
end
