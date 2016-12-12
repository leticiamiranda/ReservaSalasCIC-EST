require 'rails_helper'
require 'spec_helper'

describe UsersController do
  describe 'testes para user/sign_in' do
      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:users]
        user = FactoryGirl.create(:users)
        user.confirm!
        sign_in user
      end
      it "deve ter usuario atual (current_user) mesmo que nao haja ninguem logado" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "deve funcionar o :get index" do
        get :index
        expect(response).to be_success
      end
  end
end
