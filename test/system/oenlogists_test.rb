require "application_system_test_case"

class oenologistsTest < ApplicationSystemTestCase
  setup do
    @oenologist = oenologists(:one)
  end

  test "visiting the index" do
    visit oenologists_url
    assert_selector "h1", text: "oenologists"
  end

  test "creating a oenologist" do
    visit oenologists_url
    click_on "New oenologist"

    click_on "Create oenologist"

    assert_text "oenologist was successfully created"
    click_on "Back"
  end

  test "updating a oenologist" do
    visit oenologists_url
    click_on "Edit", match: :first

    click_on "Update oenologist"

    assert_text "oenologist was successfully updated"
    click_on "Back"
  end

  test "destroying a oenologist" do
    visit oenologists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "oenologist was successfully destroyed"
  end
end
