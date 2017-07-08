# Feature: Entrar
#   Como usuário
#   Quero poder entrar
#   Para visitar areas protegidas do site
Feature: entrar
  Background: 
    Given I am on the home page
    And I am not logged in
    Then I should see "Saiu com sucesso"
    Then I should see "Próximas Reservas"
    When I go to the sign in page
    Then I should see "Entrar"
    Then I should see "Registrar-se"
    Then I should see "Email"
    Then I should see "Esqueceu a senha?"
    Then I should see "Senha"
    And I should not see "Sair"
    
    
# SAD PATH :(
# Cenário: Usuário não consegue entrar se não for registrado
#   Dado que ainda não sou registrado
#   Quando tento entrar com minhas credenciais
#   Recebo a mensagem "E-mail ou senha inválidos." 
#   E nao consigo entrar no site 
  Scenario: User is not signed up
    Given I am not registered yet
    When I sign in with the credentials I wish I had
    Then I should see an invalid email or password message
    And I should be signed out

# Cenário: Usuário não consegue entrar com email invalido
#  Dado que sou um usuario ja registrado no sistema
#  e nao estou logado
#  quando eu entro com um email invalido
#  recebo a mensagem 'E-mail ou senha inválidos.'
#  e nao consigo entrar no site 
  Scenario: User cant sign in with wrong email
    Given I am a registered user
    And I am not logged in
    When I sign in with a wrong email
    Then I should see an invalid email or password message
    And I should be signed out

# Cenário: Usuário não consegue entrar com senha invalida
#  Dado que sou um usuario ja registrado no sistema
#  e nao estou logado
#  quando eu entro com uma senha invalida
#  recebo a mensagem 'E-mail ou senha inválidos.'
#  e nao consigo entrar no site 
  Scenario: User enters wrong password
    Given I am a registered user
    And I am not logged in
    When I sign in with a wrong password
    Then I should see an invalid email or password message
    And I should be signed out
    
# HAPPY PATH :)
# Cenário: Usuário consegue entrar pois está registrado
#   Dado que sou um usuário ja registrado no sistema
#   E ainda não entrei no sistema
#   Quando entrar com credenciais válidas
#   Vejo a mensagem 'Login efetuado com sucesso!'
#   Quando retorno ao site
#   Ja estou logado
  Scenario: User signs in successfully
    Given I am a registered user
    And I am not logged in
    When I sign in with valid credentials
    Then I should see a successful sign in message
    When I return to the site
    Then I should be signed in