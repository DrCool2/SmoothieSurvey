require "application_system_test_case"

class SmoothiechoicesTest < ApplicationSystemTestCase
  setup do
    @smoothiechoice = smoothiechoices(:one)
  end

  test "visiting the index" do
    visit smoothiechoices_url
    assert_selector "h1", text: "Smoothiechoices"
  end

  test "creating a Smoothiechoice" do
    visit smoothiechoices_url
    click_on "New Smoothiechoice"

    fill_in "Description", with: @smoothiechoice.description
    fill_in "Name", with: @smoothiechoice.name
    fill_in "Photo", with: @smoothiechoice.photo
    click_on "Create Smoothiechoice"

    assert_text "Smoothiechoice was successfully created"
    click_on "Back"
  end

  test "updating a Smoothiechoice" do
    visit smoothiechoices_url
    click_on "Edit", match: :first

    fill_in "Description", with: @smoothiechoice.description
    fill_in "Name", with: @smoothiechoice.name
    fill_in "Photo", with: @smoothiechoice.photo
    click_on "Update Smoothiechoice"

    assert_text "Smoothiechoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Smoothiechoice" do
    visit smoothiechoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Smoothiechoice was successfully destroyed"
  end
end
