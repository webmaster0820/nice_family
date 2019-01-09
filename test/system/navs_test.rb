require "application_system_test_case"

class NavsTest < ApplicationSystemTestCase
  setup do
    @nav = navs(:one)
  end

  test "visiting the index" do
    visit navs_url
    assert_selector "h1", text: "Navs"
  end

  test "creating a Nav" do
    visit navs_url
    click_on "New Nav"

    fill_in "Link", with: @nav.link
    fill_in "Title", with: @nav.title
    click_on "Create Nav"

    assert_text "Nav was successfully created"
    click_on "Back"
  end

  test "updating a Nav" do
    visit navs_url
    click_on "Edit", match: :first

    fill_in "Link", with: @nav.link
    fill_in "Title", with: @nav.title
    click_on "Update Nav"

    assert_text "Nav was successfully updated"
    click_on "Back"
  end

  test "destroying a Nav" do
    visit navs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nav was successfully destroyed"
  end
end
