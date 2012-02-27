require 'test_helper'

class ChemoinformaticsControllerTest < ActionController::TestCase
  setup do
    @chemoinformatic = chemoinformatics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chemoinformatics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chemoinformatic" do
    assert_difference('Chemoinformatic.count') do
      post :create, :chemoinformatic => @chemoinformatic.attributes
    end

    assert_redirected_to chemoinformatic_path(assigns(:chemoinformatic))
  end

  test "should show chemoinformatic" do
    get :show, :id => @chemoinformatic.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chemoinformatic.to_param
    assert_response :success
  end

  test "should update chemoinformatic" do
    put :update, :id => @chemoinformatic.to_param, :chemoinformatic => @chemoinformatic.attributes
    assert_redirected_to chemoinformatic_path(assigns(:chemoinformatic))
  end

  test "should destroy chemoinformatic" do
    assert_difference('Chemoinformatic.count', -1) do
      delete :destroy, :id => @chemoinformatic.to_param
    end

    assert_redirected_to chemoinformatics_path
  end
end
