require 'test_helper'

class CoursePlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_place = course_places(:one)
  end

  test "should get index" do
    get course_places_url
    assert_response :success
  end

  test "should get new" do
    get new_course_place_url
    assert_response :success
  end

  test "should create course_place" do
    assert_difference('CoursePlace.count') do
      post course_places_url, params: { course_place: { address: @course_place.address, description: @course_place.description, name: @course_place.name, phone: @course_place.phone } }
    end

    assert_redirected_to course_place_url(CoursePlace.last)
  end

  test "should show course_place" do
    get course_place_url(@course_place)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_place_url(@course_place)
    assert_response :success
  end

  test "should update course_place" do
    patch course_place_url(@course_place), params: { course_place: { address: @course_place.address, description: @course_place.description, name: @course_place.name, phone: @course_place.phone } }
    assert_redirected_to course_place_url(@course_place)
  end

  test "should destroy course_place" do
    assert_difference('CoursePlace.count', -1) do
      delete course_place_url(@course_place)
    end

    assert_redirected_to course_places_url
  end
end
