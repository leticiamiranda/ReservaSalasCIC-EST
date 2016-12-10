# Feature: Entrar
#   Como usuário
#   Quero poder entrar
#   Para visitar areas protegidas do site
Feature: Entrar

# Cenário: Usuário não consegue entrar se não for registrado
#   Dado que ainda não sou registrado
#   Quando tento entrar com minhas credenciais
#   Recebo a mensagem "E-mail ou senha inválidos." 
#   E nao consigo entrar no site 
  Scenario: User is not signed up
    When I am in the page
    Given I am not registered yet
    When I sign in with my credentials
    Then I see an invalid email or password message
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
    Then I see an invalid email or password message
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
    Then I see an invalid email or password message
    And I should be signed out

# Cenário: Usuário consegue entrar pois está registrado
#   Dado que sou um usuário ja registrado no sistema
#   E ainda não entrei no sistema
#   Quando entrar com credenciais válidas
#   Vejo a mensagem "Entrou com sucesso"
#   Quando retorno ao site
#   Ja estou logado
  Scenario: User signs in successfully
    Given I am a registered user
    And I am not logged in
    When I sign in with valid credentials
    Then I see a successful sign in message
    When I return to the site
    Then I should be signed in