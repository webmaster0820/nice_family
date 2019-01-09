require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "creating a Course" do
    visit courses_url
    click_on "New Course"

    fill_in "Coach", with: @course.coach_id
    fill_in "Course Day", with: @course.course_day_id
    fill_in "Course Niveau", with: @course.course_niveau_id
    fill_in "Course Place", with: @course.course_place_id
    fill_in "Description", with: @course.description
    fill_in "Name", with: @course.name
    fill_in "Price", with: @course.price
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "updating a Course" do
    visit courses_url
    click_on "Edit", match: :first

    fill_in "Coach", with: @course.coach_id
    fill_in "Course Day", with: @course.course_day_id
    fill_in "Course Niveau", with: @course.course_niveau_id
    fill_in "Course Place", with: @course.course_place_id
    fill_in "Description", with: @course.description
    fill_in "Name", with: @course.name
    fill_in "Price", with: @course.price
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "destroying a Course" do
    visit courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course was successfully destroyed"
  end
end
