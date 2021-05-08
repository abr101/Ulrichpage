require 'test_helper'

class UserinformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userinformation = userinformations(:one)
  end

  test "should get index" do
    get userinformations_url
    assert_response :success
  end

  test "should get new" do
    get new_userinformation_url
    assert_response :success
  end

  test "should create userinformation" do
    assert_difference('Userinformation.count') do
      post userinformations_url, params: { userinformation: { address: @userinformation.address, email: @userinformation.email, name: @userinformation.name, phone: @userinformation.phone } }
    end

    assert_redirected_to userinformation_url(Userinformation.last)
  end

  test "should show userinformation" do
    get userinformation_url(@userinformation)
    assert_response :success
  end

  test "should get edit" do
    get edit_userinformation_url(@userinformation)
    assert_response :success
  end

  test "should update userinformation" do
    patch userinformation_url(@userinformation), params: { userinformation: { address: @userinformation.address, email: @userinformation.email, name: @userinformation.name, phone: @userinformation.phone } }
    assert_redirected_to userinformation_url(@userinformation)
  end

  test "should destroy userinformation" do
    assert_difference('Userinformation.count', -1) do
      delete userinformation_url(@userinformation)
    end

    assert_redirected_to userinformations_url
  end
end
