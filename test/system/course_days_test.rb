require "application_system_test_case"

class CourseDaysTest < ApplicationSystemTestCase
  setup do
    @course_day = course_days(:one)
  end

  test "visiting the index" do
    visit course_days_url
    assert_selector "h1", text: "Course Days"
  end

  test "creating a Course day" do
    visit course_days_url
    click_on "New Course Day"

    fill_in "Day", with: @course_day.day
    click_on "Create Course day"

    assert_text "Course day was successfully created"
    click_on "Back"
  end

  test "updating a Course day" do
    visit course_days_url
    click_on "Edit", match: :first

    fill_in "Day", with: @course_day.day
    click_on "Update Course day"

    assert_text "Course day was successfully updated"
    click_on "Back"
  end

  test "destroying a Course day" do
    visit course_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course day was successfully destroyed"
  end
end
