require 'rails_helper'
require 'spec_helper'

describe SalasController do
  describe 'testes para salas/index' do
      before :each do
        @request.env["devise.mapping"] = Devise.mappings[:users]
        user = FactoryGirl.create(:user)
        sign_in user
      end
      it "deve funcionar o :get index de salas para usuario logado" do
        get :index
        expect(response).to be_success
      end
  end
end  