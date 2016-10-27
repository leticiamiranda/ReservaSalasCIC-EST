module Features
  module SessionHelpers
    def sign_up_with(email, password, confirmation)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Senha', with: password
      fill_in 'Confirme a senha', :with => confirmation
      click_button 'Confirmar registro'
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Senha', with: password
      click_button 'Entrar'
    end
  end
end
