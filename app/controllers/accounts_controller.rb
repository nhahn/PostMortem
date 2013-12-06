class AccountsController < ApplicationController
  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accounts }
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account = Account.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account }
    end
  end

  # GET /accounts/new
  # GET /accounts/new.json
  def new
    if (current_user.nil?)
      redirect_to login_url
      return
    end

    @accounts = current_user.accounts
    @account_types = AccountType.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account }
      format.js
    end
  end

  # GET /accounts/1/edit
  def edit
    @account = Account.find(params[:id])
    @account_type = @account.account_type
    @accounts = current_user.accounts
    @account_types = AccountType.all
  
    respond_to do |format|
      format.html
      format.js { render 'select_account' } 
    end
  
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(params[:account])
    @account.user_id = current_user.id
    @account.account_type_id = session[:account_type]
    @account_type = AccountType.find(session[:account_type])


    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: 'Account was successfully created.' }
        format.json { render json: @account, status: :created, location: @account }
        format.js 
      else
        format.html { render action: "new" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
        format.js { render 'select_account' }
      end
    end
  end

  def select_account
    @account = Account.new
    @account_type = AccountType.find(params[:account_type])
    session[:account_type] = @account_type.id
  end

  # PUT /accounts/1
  # PUT /accounts/1.json
  def update
    @account = Account.find(params[:id])
    @account_type = @account.account_type 

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { head :no_content }
        format.js 
      else
        format.html { render action: "edit" }
        format.json { render json: @account.errors, status: :unprocessable_entity }
        format.js { render 'select_account'}
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to accounts_url }
      format.json { head :no_content }
      format.js
    end
  end
end
