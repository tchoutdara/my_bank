require 'rails_helper'

RSpec.describe BankAccountsController, type: :controller do
  login_user
  let(:valid_attributes) {
    { institution: 'Chase', amount: 200, active: true }
  }

  let(:invalid_attributes) {
    { institution: '', amount: 200, active: true}
  }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      bank_account = @user.bank_accounts.create! valid_attributes
      BankAccount.find(params[:id])
      get :show, params: { id: bank_account.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      bank_account = @user.bank_accounts.create! valid_attributes
      get :edit, params: { id: bank_account.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BankAccount" do
        expect {
          post :create, params: {
            bank_account: valid_attributes
          }
        }.to change(BankAccount, :count).by(1)
      end

      it 'redirects to created bank account' do
        post :create, params: { bank_account: valid_attributes }
        expect(response).to redirect_to(BankAccount.last)
      end
    end

    context "without valid params" do
      it "does not create a BankAccount" do
        expect {
          post :create, params: { bank_account: invalid_attributes }
      }.to change(BankAccount, :count).by(0)
    end

    it "return http response (render :new)" do
      post :create, params: { bank_account: invalid_attributes }
      expect(response).to have_http_status(:success)
    end
  end
end



end
