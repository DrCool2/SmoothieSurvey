require 'test_helper'

class SmoothiechoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @smoothiechoice = smoothiechoices(:one)
  end

  test "should get index" do
    get smoothiechoices_url
    assert_response :success
  end

  test "should get new" do
    get new_smoothiechoice_url
    assert_response :success
  end

  test "should create smoothiechoice" do
    assert_difference('Smoothiechoice.count') do
      post smoothiechoices_url, params: { smoothiechoice: { description: @smoothiechoice.description, name: @smoothiechoice.name, photo: @smoothiechoice.photo } }
    end

    assert_redirected_to smoothiechoice_url(Smoothiechoice.last)
  end

  test "should show smoothiechoice" do
    get smoothiechoice_url(@smoothiechoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_smoothiechoice_url(@smoothiechoice)
    assert_response :success
  end

  test "should update smoothiechoice" do
    patch smoothiechoice_url(@smoothiechoice), params: { smoothiechoice: { description: @smoothiechoice.description, name: @smoothiechoice.name, photo: @smoothiechoice.photo } }
    assert_redirected_to smoothiechoice_url(@smoothiechoice)
  end

  test "should destroy smoothiechoice" do
    assert_difference('Smoothiechoice.count', -1) do
      delete smoothiechoice_url(@smoothiechoice)
    end

    assert_redirected_to smoothiechoices_url
  end
end
