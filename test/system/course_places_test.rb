require "application_system_test_case"

class CoursePlacesTest < ApplicationSystemTestCase
  setup do
    @course_place = course_places(:one)
  end

  test "visiting the index" do
    visit course_places_url
    assert_selector "h1", text: "Course Places"
  end

  test "creating a Course place" do
    visit course_places_url
    click_on "New Course Place"

    fill_in "Address", with: @course_place.address
    fill_in "Description", with: @course_place.description
    fill_in "Name", with: @course_place.name
    fill_in "Phone", with: @course_place.phone
    click_on "Create Course place"

    assert_text "Course place was successfully created"
    click_on "Back"
  end

  test "updating a Course place" do
    visit course_places_url
    click_on "Edit", match: :first

    fill_in "Address", with: @course_place.address
    fill_in "Description", with: @course_place.description
    fill_in "Name", with: @course_place.name
    fill_in "Phone", with: @course_place.phone
    click_on "Update Course place"

    assert_text "Course place was successfully updated"
    click_on "Back"
  end

  test "destroying a Course place" do
    visit course_places_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course place was successfully destroyed"
  end
end
