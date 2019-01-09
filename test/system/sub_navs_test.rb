require "application_system_test_case"

class SubNavsTest < ApplicationSystemTestCase
  setup do
    @sub_nav = sub_navs(:one)
  end

  test "visiting the index" do
    visit sub_navs_url
    assert_selector "h1", text: "Sub Navs"
  end

  test "creating a Sub nav" do
    visit sub_navs_url
    click_on "New Sub Nav"

    fill_in "Nav", with: @sub_nav.nav
    fill_in "Page", with: @sub_nav.page
    fill_in "Title", with: @sub_nav.title
    click_on "Create Sub nav"

    assert_text "Sub nav was successfully created"
    click_on "Back"
  end

  test "updating a Sub nav" do
    visit sub_navs_url
    click_on "Edit", match: :first

    fill_in "Nav", with: @sub_nav.nav
    fill_in "Page", with: @sub_nav.page
    fill_in "Title", with: @sub_nav.title
    click_on "Update Sub nav"

    assert_text "Sub nav was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub nav" do
    visit sub_navs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub nav was successfully destroyed"
  end
end
