require "application_system_test_case"

class EmailsTest < ApplicationSystemTestCase
  setup do
    @email = emails(:one)
  end

  test "visiting the index" do
    visit emails_url
    assert_selector "h1", text: "Emails"
  end

  test "creating a Email" do
    visit emails_url
    click_on "New Email"

    fill_in "Content", with: @email.content
    fill_in "Course", with: @email.course_id
    fill_in "Member", with: @email.member_id
    fill_in "Subject", with: @email.subject
    click_on "Create Email"

    assert_text "Email was successfully created"
    click_on "Back"
  end

  test "updating a Email" do
    visit emails_url
    click_on "Edit", match: :first

    fill_in "Content", with: @email.content
    fill_in "Course", with: @email.course_id
    fill_in "Member", with: @email.member_id
    fill_in "Subject", with: @email.subject
    click_on "Update Email"

    assert_text "Email was successfully updated"
    click_on "Back"
  end

  test "destroying a Email" do
    visit emails_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Email was successfully destroyed"
  end
end
