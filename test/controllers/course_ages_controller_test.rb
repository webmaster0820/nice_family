require 'test_helper'

class CourseAgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_age = course_ages(:one)
  end

  test "should get index" do
    get course_ages_url
    assert_response :success
  end

  test "should get new" do
    get new_course_age_url
    assert_response :success
  end

  test "should create course_age" do
    assert_difference('CourseAge.count') do
      post course_ages_url, params: { course_age: { age_from: @course_age.age_from, age_to: @course_age.age_to } }
    end

    assert_redirected_to course_age_url(CourseAge.last)
  end

  test "should show course_age" do
    get course_age_url(@course_age)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_age_url(@course_age)
    assert_response :success
  end

  test "should update course_age" do
    patch course_age_url(@course_age), params: { course_age: { age_from: @course_age.age_from, age_to: @course_age.age_to } }
    assert_redirected_to course_age_url(@course_age)
  end

  test "should destroy course_age" do
    assert_difference('CourseAge.count', -1) do
      delete course_age_url(@course_age)
    end

    assert_redirected_to course_ages_url
  end
end
