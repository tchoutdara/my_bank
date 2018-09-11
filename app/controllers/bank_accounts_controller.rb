class BankAccountsController < ApplicationController

before_action :authenticate_user!
before_action :set_account, only: [:show, :edit, :destroy, :update]

  def index
    @bank_accounts = current_user.bank_accounts
  end

  def show
  end

  def new
    @bank_account = current_user.bank_accounts.new
  end

  def create
    @bank_account = current_user.bank_accounts.new(account_params)

    if@bank_account.save
      redirect_to @bank_account, notice: "Account Created"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @bank_account.update(account_params)
      redirect_to @bank_account, notice: "Account Updated"
    else
      render :edit
    end
  end

  def destroy
    @bank_account.destroy
    redirect_to bank_accounts_path, notice: "Account Deleted"
  end

  private

    def set_account
      @bank_account = current_user.bank_accounts.find(params[:id])
    end

    def account_params
      params.require(:bank_account).permit(:title, :institution, :amount, :description, :active)
    end

end
