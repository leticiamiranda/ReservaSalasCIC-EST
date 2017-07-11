require 'rails_helper'
require 'spec_helper'

describe ReservasController do
  describe 'testes para reservas/index' do
      it "deve funcionar o :get index de reservas mesmo que n haja usuario logado" do
        get :index
        expect(response).to be_success
      end
  end
end  