require 'test_helper'

class PostAdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_ad = post_ads(:one)
  end

  test "should get index" do
    get post_ads_url
    assert_response :success
  end

  test "should get new" do
    get new_post_ad_url
    assert_response :success
  end

  test "should create post_ad" do
    assert_difference('PostAd.count') do
      post post_ads_url, params: { post_ad: { description: @post_ad.description, email: @post_ad.email, get_response: @post_ad.get_response, images: @post_ad.images, keywords: @post_ad.keywords, location: @post_ad.location, phone: @post_ad.phone, terms_privacy: @post_ad.terms_privacy, title: @post_ad.title } }
    end

    assert_redirected_to post_ad_url(PostAd.last)
  end

  test "should show post_ad" do
    get post_ad_url(@post_ad)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_ad_url(@post_ad)
    assert_response :success
  end

  test "should update post_ad" do
    patch post_ad_url(@post_ad), params: { post_ad: { description: @post_ad.description, email: @post_ad.email, get_response: @post_ad.get_response, images: @post_ad.images, keywords: @post_ad.keywords, location: @post_ad.location, phone: @post_ad.phone, terms_privacy: @post_ad.terms_privacy, title: @post_ad.title } }
    assert_redirected_to post_ad_url(@post_ad)
  end

  test "should destroy post_ad" do
    assert_difference('PostAd.count', -1) do
      delete post_ad_url(@post_ad)
    end

    assert_redirected_to post_ads_url
  end
end
