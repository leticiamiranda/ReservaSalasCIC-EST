def registrar_usuario
  apaga_usuario
  visit '/users/sign_up'
  fill_in 'user_name', :with => @visitor[:name]
  fill_in 'user_email', :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Registrar-se"
  @user ||= User.where(:email => @visitor[:email]).first
end

When (/^I sign up with valid data$/) do
  cria_usuario_visitante
  registrar_usuario
end

Then (/^I should see a successful sign up message$/) do
  page.should have_content "Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail."
end

When (/^I sign up without a password$/) do
  cria_usuario_visitante
  @visitor[:password] = ""
  registrar_usuario
end

Then (/^I should see a missing password message$/) do
  page.should have_content "Password não pode ficar em branco"
end

When (/^I sign up without a password confirmation$/) do
  cria_usuario_visitante
  @visitor[:password_confirmation] = ""
  registrar_usuario
end

Then (/^I should see a missing password confirmation message$/) do
  page.should have_content "Password confirmation não é igual a Password"
end

When (/^I sign up with a mismatched password confirmation$/) do
  cria_usuario_visitante
  @visitor[:password_confirmation] = "7654321"
  registrar_usuario
end

Then (/^I should see a mismatched password message$/) do
  page.should have_content "Password confirmation não é igual a Password"
end
