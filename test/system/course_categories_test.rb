require "application_system_test_case"

class CourseCategoriesTest < ApplicationSystemTestCase
  setup do
    @course_category = course_categories(:one)
  end

  test "visiting the index" do
    visit course_categories_url
    assert_selector "h1", text: "Course Categories"
  end

  test "creating a Course category" do
    visit course_categories_url
    click_on "New Course Category"

    fill_in "Name", with: @course_category.name
    click_on "Create Course category"

    assert_text "Course category was successfully created"
    click_on "Back"
  end

  test "updating a Course category" do
    visit course_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @course_category.name
    click_on "Update Course category"

    assert_text "Course category was successfully updated"
    click_on "Back"
  end

  test "destroying a Course category" do
    visit course_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course category was successfully destroyed"
  end
end
