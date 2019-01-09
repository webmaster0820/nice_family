require 'test_helper'

class CourseNiveausControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_niveau = course_niveaus(:one)
  end

  test "should get index" do
    get course_niveaus_url
    assert_response :success
  end

  test "should get new" do
    get new_course_niveau_url
    assert_response :success
  end

  test "should create course_niveau" do
    assert_difference('CourseNiveau.count') do
      post course_niveaus_url, params: { course_niveau: { description: @course_niveau.description, name: @course_niveau.name } }
    end

    assert_redirected_to course_niveau_url(CourseNiveau.last)
  end

  test "should show course_niveau" do
    get course_niveau_url(@course_niveau)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_niveau_url(@course_niveau)
    assert_response :success
  end

  test "should update course_niveau" do
    patch course_niveau_url(@course_niveau), params: { course_niveau: { description: @course_niveau.description, name: @course_niveau.name } }
    assert_redirected_to course_niveau_url(@course_niveau)
  end

  test "should destroy course_niveau" do
    assert_difference('CourseNiveau.count', -1) do
      delete course_niveau_url(@course_niveau)
    end

    assert_redirected_to course_niveaus_url
  end
end
