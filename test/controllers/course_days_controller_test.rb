require 'test_helper'

class CourseDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_day = course_days(:one)
  end

  test "should get index" do
    get course_days_url
    assert_response :success
  end

  test "should get new" do
    get new_course_day_url
    assert_response :success
  end

  test "should create course_day" do
    assert_difference('CourseDay.count') do
      post course_days_url, params: { course_day: { day: @course_day.day } }
    end

    assert_redirected_to course_day_url(CourseDay.last)
  end

  test "should show course_day" do
    get course_day_url(@course_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_day_url(@course_day)
    assert_response :success
  end

  test "should update course_day" do
    patch course_day_url(@course_day), params: { course_day: { day: @course_day.day } }
    assert_redirected_to course_day_url(@course_day)
  end

  test "should destroy course_day" do
    assert_difference('CourseDay.count', -1) do
      delete course_day_url(@course_day)
    end

    assert_redirected_to course_days_url
  end
end
