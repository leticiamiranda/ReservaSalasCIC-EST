require "spec_helper"

# Feature: Entrar
#   Como usuário
#   Quero entrar
#   Para visitar areas protegidas do site
feature 'Entrar', :devise do

  # Cenário: Usuário não consegue entrar se não for registrado
  #   Dado que ainda não sou registrado
  #   Quando tento entrar com minhas credenciais
  #   Recebo a mensagem "E-mail ou senha inválidos."
  scenario 'Usuario nao consegue entrar se nao for registrado' do
    entrar('teste@example.com', 'please123')
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end

  # Cenário: Usuário consegue entrar pois está registrado
  #   Dado que sou um usuário
  #   E ainda não entrei no sistema
  #   Quando entrar com credenciais válidas
  #   Vejo a mensagem "Entrou com sucesso"
  scenario 'Usuário consegue entrar pois está registrado' do
    usuario = FactoryGirl.create(:user)
    entrar(usuario.email, usuario.password)
    expect(page).to have_content I18n.t 'devise.sessions.signed_in'
  end

  # Cenário: Usuário não consegue entrar com email invalido
  #  Dado que sou um usuario
  #  e nao estou logado
  #  quando eu entro com um email invalido
  #  recebo a mensagem 'E-mail ou senha inválidos.'
  scenario 'Usuario nao consegue entrar com email invalido' do
    usuario = FactoryGirl.create(:user)
    entrar('invalid@email.com', usuario.password)
    expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
  end

  # Cenário: Usuário não consegue entrar com senha invalida
  #  Dado que sou um usuario
  #  e nao estou logado
  #  quando eu entro com uma senha invalida
  #  recebo a mensagem 'E-mail ou senha inválidos.'
  scenario 'Usuario nao consegue entrar com senha invalida' do
    usuario = FactoryGirl.create(:user)
    entrar(usuario.email, 'invalidpass')
    expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'email'
  end

end
