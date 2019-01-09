require "application_system_test_case"

class CourseAgesTest < ApplicationSystemTestCase
  setup do
    @course_age = course_ages(:one)
  end

  test "visiting the index" do
    visit course_ages_url
    assert_selector "h1", text: "Course Ages"
  end

  test "creating a Course age" do
    visit course_ages_url
    click_on "New Course Age"

    fill_in "Age From", with: @course_age.age_from
    fill_in "Age To", with: @course_age.age_to
    click_on "Create Course age"

    assert_text "Course age was successfully created"
    click_on "Back"
  end

  test "updating a Course age" do
    visit course_ages_url
    click_on "Edit", match: :first

    fill_in "Age From", with: @course_age.age_from
    fill_in "Age To", with: @course_age.age_to
    click_on "Update Course age"

    assert_text "Course age was successfully updated"
    click_on "Back"
  end

  test "destroying a Course age" do
    visit course_ages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course age was successfully destroyed"
  end
end
