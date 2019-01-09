require "application_system_test_case"

class GrandparentsTest < ApplicationSystemTestCase
  setup do
    @grandparent = grandparents(:one)
  end

  test "visiting the index" do
    visit grandparents_url
    assert_selector "h1", text: "Grandparents"
  end

  test "creating a Grandparent" do
    visit grandparents_url
    click_on "New Grandparent"

    fill_in "Child", with: @grandparent.child_id
    fill_in "Course", with: @grandparent.course_id
    fill_in "First Name", with: @grandparent.first_name
    fill_in "Last Name", with: @grandparent.last_name
    fill_in "Member", with: @grandparent.member_id
    click_on "Create Grandparent"

    assert_text "Grandparent was successfully created"
    click_on "Back"
  end

  test "updating a Grandparent" do
    visit grandparents_url
    click_on "Edit", match: :first

    fill_in "Child", with: @grandparent.child_id
    fill_in "Course", with: @grandparent.course_id
    fill_in "First Name", with: @grandparent.first_name
    fill_in "Last Name", with: @grandparent.last_name
    fill_in "Member", with: @grandparent.member_id
    click_on "Update Grandparent"

    assert_text "Grandparent was successfully updated"
    click_on "Back"
  end

  test "destroying a Grandparent" do
    visit grandparents_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grandparent was successfully destroyed"
  end
end
