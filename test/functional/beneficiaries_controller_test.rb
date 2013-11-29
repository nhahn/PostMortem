require 'test_helper'

class BeneficiariesControllerTest < ActionController::TestCase
  setup do
    @beneficiary = beneficiaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beneficiaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create beneficiary" do
    assert_difference('Beneficiary.count') do
      post :create, beneficiary: { city: @beneficiary.city, email: @beneficiary.email, first_name: @beneficiary.first_name, last_name: @beneficiary.last_name, phone: @beneficiary.phone, relationship: @beneficiary.relationship, state: @beneficiary.state, street: @beneficiary.street, zip: @beneficiary.zip }
    end

    assert_redirected_to beneficiary_path(assigns(:beneficiary))
  end

  test "should show beneficiary" do
    get :show, id: @beneficiary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @beneficiary
    assert_response :success
  end

  test "should update beneficiary" do
    put :update, id: @beneficiary, beneficiary: { city: @beneficiary.city, email: @beneficiary.email, first_name: @beneficiary.first_name, last_name: @beneficiary.last_name, phone: @beneficiary.phone, relationship: @beneficiary.relationship, state: @beneficiary.state, street: @beneficiary.street, zip: @beneficiary.zip }
    assert_redirected_to beneficiary_path(assigns(:beneficiary))
  end

  test "should destroy beneficiary" do
    assert_difference('Beneficiary.count', -1) do
      delete :destroy, id: @beneficiary
    end

    assert_redirected_to beneficiaries_path
  end
end
