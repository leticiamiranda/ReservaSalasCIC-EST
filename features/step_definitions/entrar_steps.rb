# Implementacao de testes de aceitacao usando Cucumber, Capybara e Rspec
def cria_usuario_visitante
  @visitor ||= { :name => "Leticia", :email => "letiiribeiro@gmail.com",
:password => "111111", :password_confirmation => "111111" }
end

def cria_usuario 
  cria_usuario_visitante
  apaga_usuario
  @user = User.create!({
   :name => "usuarioteste",
   :email => "testando@exemplo.com",
   :password => "12345678",
   :password_confirmation => "12345678", 
   :confirmed_at => Time.now
 })
end

def entrar
  visit '/users/sign_in'
  fill_in 'user_email', :with => @visitor[:email]
  fill_in 'user_password', :with => @visitor[:password]
  click_button 'Entrar'
end

def apaga_usuario
  @user ||= User.where(:email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

Given /^I am not registered yet$/ do
  cria_usuario_visitante
  apaga_usuario
end

When /^I sign in with my credentials$/ do
  cria_usuario_visitante
  entrar
end

Then /^I should see an invalid email or password message$/ do
  expect(page).to have_content "E-mail ou senha inválidos."
end

Then /^I should be signed out$/ do
  expect(page).to have_content "Registrar-se"
  expect(page).to have_content "Entrar"
  expect(page).to_not have_content "Sair"
end

Given /^I am a registered user$/ do
  cria_usuario
end

Given /^I am not logged in$/ do
  visit destroy_user_session_path
end

When /^I sign in with a wrong email$/ do
  cria_usuario_visitante
  @visitor[:email] = "emailerrado@teste.com"
  entrar
end

When /^I sign in with a wrong password$/ do
  cria_usuario_visitante
  @visitor[:encrypted_password] = "111213546312352225811"
  entrar
end

Then(/^I should see a successful sign in message$/) do
  expect(page).to have_content 'Login efetuado com sucesso!'
end

When(/^I return to the site$/) do
  visit '/'
end

Then(/^I should be signed in$/) do
  expect(page).to have_content "Sair"
  expect(page).to_not have_content "Entrar"
  expect(page).to_not have_content "Registrar-se"
end


Then (/^show me the page$/) do
  save_and_open_page
end
