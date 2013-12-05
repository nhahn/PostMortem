class AccountBeneficiariesController < ApplicationController
  # GET /account_beneficiaries
  # GET /account_beneficiaries.json
  def index
    @account_beneficiaries = AccountBeneficiary.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_beneficiaries }
    end
  end

  # GET /account_beneficiaries/1
  # GET /account_beneficiaries/1.json
  def show
    @account_beneficiary = AccountBeneficiary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_beneficiary }
    end
  end

  # GET /account_beneficiaries/new
  # GET /account_beneficiaries/new.json
  def new
    @account_beneficiary = AccountBeneficiary.new
    @account_beneficiaries = current_user.account_beneficiaries

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_beneficiary }
    end
  end

  # GET /account_beneficiaries/1/edit
  def edit
    @account_beneficiary = AccountBeneficiary.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def check_option
    @account = Account.find(params[:id])

    render json: @account.account_type.permissions.to_json
  end

  # POST /account_beneficiaries
  # POST /account_beneficiaries.json
  def create
    @account_beneficiary = AccountBeneficiary.new(params[:account_beneficiary])

    respond_to do |format|
      if @account_beneficiary.save
        format.html { redirect_to @account_beneficiary, notice: 'Account beneficiary was successfully created.' }
        format.json { render json: @account_beneficiary, status: :created, location: @account_beneficiary }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @account_beneficiary.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /account_beneficiaries/1
  # PUT /account_beneficiaries/1.json
  def update
    @account_beneficiary = AccountBeneficiary.find(params[:id])

    respond_to do |format|
      if @account_beneficiary.update_attributes(params[:account_beneficiary])
        format.html { redirect_to @account_beneficiary, notice: 'Account beneficiary was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @account_beneficiary.errors, status: :unprocessable_entity }
        format.js { render 'create' }
      end
    end
  end

  # DELETE /account_beneficiaries/1
  # DELETE /account_beneficiaries/1.json
  def destroy
    @account_beneficiary = AccountBeneficiary.find(params[:id])
    @account_beneficiary.destroy

    respond_to do |format|
      format.html { redirect_to account_beneficiaries_url }
      format.json { head :no_content }
      format.js
    end
  end
end
