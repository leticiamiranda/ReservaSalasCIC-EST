Feature: List My Reservas with Google Calendar Integration
  
  Background: User is logged in
    Given I am registered as a user
    And My role is teacher
    # And The following reservas exist
    # | sala | autor  | data_hora_inicio    | data_hora_fim
    # | AT50 | teste  | 2016-12-13T16:00:00 | 2016-12-13T17:00:00 
    # | AT26 | fulano | 2016-12-14T18:00:00 | 2016-12-14T19:00:00
    # | AT30 | teste  | 2016-12-13T13:00:00 | 2016-12-13T14:00:00 
    
  Scenario: Show minhas reservas filter to a logged user
    Given I am logged in
    When I visit reservas page
    Then I should see Filtrar button
  
  Scenario: Show only reservas desiganted to logged teacher
    Given I am logged in
    When I visit reservas page
    And I check in Minhas Reservas
    And I click on Filtrar
    Then I should only see reservas designated to me
    
  Scenario: Don't show minhas reservas filter to a unlogged user
    Given I am not logged in
    When I visit reservas page
    Then I should not see Filtrar button