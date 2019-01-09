require "application_system_test_case"

class CourseNiveausTest < ApplicationSystemTestCase
  setup do
    @course_niveau = course_niveaus(:one)
  end

  test "visiting the index" do
    visit course_niveaus_url
    assert_selector "h1", text: "Course Niveaus"
  end

  test "creating a Course niveau" do
    visit course_niveaus_url
    click_on "New Course Niveau"

    fill_in "Description", with: @course_niveau.description
    fill_in "Name", with: @course_niveau.name
    click_on "Create Course niveau"

    assert_text "Course niveau was successfully created"
    click_on "Back"
  end

  test "updating a Course niveau" do
    visit course_niveaus_url
    click_on "Edit", match: :first

    fill_in "Description", with: @course_niveau.description
    fill_in "Name", with: @course_niveau.name
    click_on "Update Course niveau"

    assert_text "Course niveau was successfully updated"
    click_on "Back"
  end

  test "destroying a Course niveau" do
    visit course_niveaus_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course niveau was successfully destroyed"
  end
end
