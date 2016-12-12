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
        it "should have a current_user" do
          expect(subject.current_user).to_not eq(nil)
        end
    end
end
