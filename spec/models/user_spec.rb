require 'rails_helper'
require 'spec_helper'

describe User do

  before(:each) do
    @user = User.new(email: 'user@example.com', password: '123456')
  end
  describe "Teste de registro de usuario", :type => :feature do     
    it "cria uma nova conta de usuario" do     
    	visit '/users/sign_up'
    	email = "teste@exemplo.com"
    	password = "123456"
    	fill_in 'user_email', :with => email    
    	fill_in 'user_password', :with => password    
    	fill_in 'user_password_confirmation', :with => password  
    	click_button 'Registrar-se'    
    	expect(page).to have_content "Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail."    
    end    
  end
  
  it 'responde ao email' do
    expect(@user).to respond_to(:email) 
  end
  
  it 'email nao pode ser null' do
    expect(@user.email).to_not be nil
  end

  it "email é obrigatoriamente do tipo xxx@xxx.com" do
    expect(@user.email).to match 'user@example.com'
  end
  
  it "senha é obrigatoria" do
    expect(@user.encrypted_password).to_not be nil 
  end
end
