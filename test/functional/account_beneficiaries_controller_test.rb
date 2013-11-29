require 'test_helper'

class AccountBeneficiariesControllerTest < ActionController::TestCase
  setup do
    @account_beneficiary = account_beneficiaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_beneficiaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_beneficiary" do
    assert_difference('AccountBeneficiary.count') do
      post :create, account_beneficiary: { account_id: @account_beneficiary.account_id, beneficiary_id: @account_beneficiary.beneficiary_id, permission: @account_beneficiary.permission }
    end

    assert_redirected_to account_beneficiary_path(assigns(:account_beneficiary))
  end

  test "should show account_beneficiary" do
    get :show, id: @account_beneficiary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_beneficiary
    assert_response :success
  end

  test "should update account_beneficiary" do
    put :update, id: @account_beneficiary, account_beneficiary: { account_id: @account_beneficiary.account_id, beneficiary_id: @account_beneficiary.beneficiary_id, permission: @account_beneficiary.permission }
    assert_redirected_to account_beneficiary_path(assigns(:account_beneficiary))
  end

  test "should destroy account_beneficiary" do
    assert_difference('AccountBeneficiary.count', -1) do
      delete :destroy, id: @account_beneficiary
    end

    assert_redirected_to account_beneficiaries_path
  end
end
