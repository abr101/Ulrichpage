require "application_system_test_case"

class UserinformationsTest < ApplicationSystemTestCase
  setup do
    @userinformation = userinformations(:one)
  end

  test "visiting the index" do
    visit userinformations_url
    assert_selector "h1", text: "Userinformations"
  end

  test "creating a Userinformation" do
    visit userinformations_url
    click_on "New Userinformation"

    fill_in "Address", with: @userinformation.address
    fill_in "Email", with: @userinformation.email
    fill_in "Name", with: @userinformation.name
    fill_in "Phone", with: @userinformation.phone
    click_on "Create Userinformation"

    assert_text "Userinformation was successfully created"
    click_on "Back"
  end

  test "updating a Userinformation" do
    visit userinformations_url
    click_on "Edit", match: :first

    fill_in "Address", with: @userinformation.address
    fill_in "Email", with: @userinformation.email
    fill_in "Name", with: @userinformation.name
    fill_in "Phone", with: @userinformation.phone
    click_on "Update Userinformation"

    assert_text "Userinformation was successfully updated"
    click_on "Back"
  end

  test "destroying a Userinformation" do
    visit userinformations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Userinformation was successfully destroyed"
  end
end
