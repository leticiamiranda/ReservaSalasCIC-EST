# Implementacao de testes de aceitacao usando Cucumber, Capybara e Rspec
def cria_usuario_visitante
  @visitor ||= { :name => "Visitante teste", :email => "teste@example.com",
:password => "123123", :password_confirmation => "123123" }
end

def cria_usuario 
  cria_usuario_visitante
  apaga_usuario
  User.create!({
   :name => "usuarioteste",
   :email => "testando@exemplo.com",
   :password => "12345678",
   :password_confirmation => "12345678", 
   :confirmed_at => Time.now
 })
end

def entrar_visitante
  visit '/users/sign_in'
  fill_in 'user_email', :with => @visitor[:email]
  fill_in 'user_password', :with => @visitor[:password]
  click_button 'Entrar'
end

def entrar_usuario(email, password)
  visit '/users/sign_in'
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
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

When /^I sign in with the credentials I wish I had$/ do
  cria_usuario_visitante
  entrar_visitante
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
  entrar_visitante
end

When /^I sign in with a wrong password$/ do
  cria_usuario_visitante
  @visitor[:encrypted_password] = "111213546312352225811"
  entrar_visitante
end

Then(/^I should see a successful sign in message$/) do
  expect(page).to have_content 'Login efetuado com sucesso!'
end

When(/^I return to the site$/) do
  visit '/'
end

Then(/^I should be signed in$/) do
  expect(page).to_not have_content "Entrar"
  expect(page).to_not have_content "Registrar-se"
end

When (/^I sign in with valid credentials$/) do
  email = 'testando@user.com'
  password = '123456'
  User.new(:email => email, :password => password, :password_confirmation => password, :confirmed_at => Time.now).save!
  entrar_usuario(email, password)
end
