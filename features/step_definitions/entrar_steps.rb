def cria_usuario 
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
  fill_in 'user_email', :with => @user[:email]
  fill_in 'user_password', :with => @user[:password]
  click_button 'Entrar'
end

Given /^I am not registered yet$/ do
  @user.destroy unless @user.nil?
end

When /^I sign in with my credentials$/ do
  cria_usuario if @user.nil?
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
  @user[:email]= "emailerrado@teste.com"
  entrar
end

