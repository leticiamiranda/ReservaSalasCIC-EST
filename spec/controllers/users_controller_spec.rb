require 'rails_helper'
require 'spec_helper'

describe UsersController do
  describe 'testes para user/sign_in' do
      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:users]
        user = FactoryGirl.create(:user)
        sign_in user
      end
      it "deve ter usuario atual (current_user)" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "nao deve funcionar o :get index para usuario normal" do
        get :index
        expect(response).not_to be_success
      end
      it "deve funcionar o :get show para usuario normal" do
        get :show, id: 1
        expect(response).to be_success
      end
      it "nao deve funcionar o :get edit para usuario normal" do
        get :edit, id: 1
        expect(response).not_to be_success
      end
      
  end
  describe 'testes para usuario admin' do
    before :each do
        @request.env["devise.mapping"] = Devise.mappings[:users]
        user = FactoryGirl.create(:user, :admin)
        sign_in user
      end
      it "deve funcionar o :get index para usuario admin" do
        get :index
        expect(response).to be_success
      end
      it "deve ter usuario atual (current_user) mesmo que nao haja ninguem logado" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "deve funcionar o :get show para usuario admin" do
        get :show, id: 1
        expect(response).to be_success
      end
      it "deve funcionar o :get edit somente para usuario admin" do
        get :edit, id: 1
        expect(response).to be_success
      end
  end
end
