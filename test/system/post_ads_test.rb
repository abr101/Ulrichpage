require "application_system_test_case"

class PostAdsTest < ApplicationSystemTestCase
  setup do
    @post_ad = post_ads(:one)
  end

  test "visiting the index" do
    visit post_ads_url
    assert_selector "h1", text: "Post Ads"
  end

  test "creating a Post ad" do
    visit post_ads_url
    click_on "New Post Ad"

    fill_in "Description", with: @post_ad.description
    fill_in "Email", with: @post_ad.email
    check "Get response" if @post_ad.get_response
    fill_in "Images", with: @post_ad.images
    fill_in "Keywords", with: @post_ad.keywords
    fill_in "Location", with: @post_ad.location
    fill_in "Phone", with: @post_ad.phone
    check "Terms privacy" if @post_ad.terms_privacy
    fill_in "Title", with: @post_ad.title
    click_on "Create Post ad"

    assert_text "Post ad was successfully created"
    click_on "Back"
  end

  test "updating a Post ad" do
    visit post_ads_url
    click_on "Edit", match: :first

    fill_in "Description", with: @post_ad.description
    fill_in "Email", with: @post_ad.email
    check "Get response" if @post_ad.get_response
    fill_in "Images", with: @post_ad.images
    fill_in "Keywords", with: @post_ad.keywords
    fill_in "Location", with: @post_ad.location
    fill_in "Phone", with: @post_ad.phone
    check "Terms privacy" if @post_ad.terms_privacy
    fill_in "Title", with: @post_ad.title
    click_on "Update Post ad"

    assert_text "Post ad was successfully updated"
    click_on "Back"
  end

  test "destroying a Post ad" do
    visit post_ads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post ad was successfully destroyed"
  end
end
