# Feature: Registrar
#   Como usuário
#   Quero poder me registrar no sistema
#   Para visitar areas protegidas do site
Feature: Registrar
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

    Background:
      Given I am not logged in

# Happy path
# usuario se cadastra com dados validos
# quando me cadastro usando dados validos de usuario
# vejo a mensagem 'Login efetuado com sucesso. Se não foi autorizado, a confirmação será enviada por e-mail.'
      # Scenario: User signs up with valid data
      #   When I sign up with valid data
      #   Then I should see a successful sign up message
        
# Cenário: Usuário não consegue registrar com email invalido
#  quando eu entro com um email invalido
#  recebo a mensagem Email não pode ficar em branco
      # Scenario: User signs up with invalid email
      #   When I sign up with an invalid email
      #   Then I should see an invalid email message
        
# Cenário: Usuário não consegue se registrar sem senha
#  Quando me registro sem senha
#  recebo a mensagem Password não pode ficar em branco
      Scenario: User signs up without password
        When I sign up without a password
        Then I should see a missing password message

# Cenário: Usuário não consegue se registrar quando a confirmacao da senha e diferente da senha
#  Quando me registro sem confirmacao da senha
#  recebo a mensagem Password confirmation não é igual a Password
      Scenario: User signs up without password confirmation
        When I sign up without a password confirmation
        Then I should see a missing password confirmation message
        
# Cenário: Usuário não consegue se registrar sem escrever a confirmacao da senha
#  Quando me registro sem confirmacao da senha
#  recebo a mensagem Password confirmation não é igual a Password
      Scenario: User signs up with mismatched password and confirmation
        When I sign up with a mismatched password confirmation
        Then I should see a mismatched password message