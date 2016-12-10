Feature: List Reservas with Google Calendar Integration
  
  Background: Teacher is logged in
    Given I exist as a user
    And My role is teacher
    And I am logged in
  
  Scenario: Display reservas present on Google Calendar in a table
    When I visit reservas page
    Then I should see a table with all reservas made on google calendar