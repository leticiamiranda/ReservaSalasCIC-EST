Feature: List Reservas with Google Calendar Integration
  As a teacher
  In order to see all bookings made for me, or my colleages, also the availability of classrooms
  I want to hava a table in which I can see all reservas made with google calendar API
  
  Background: User is logged in
    Given I am registered as a user
  
  Scenario: Show bookings made on Google Calendar API in a table to a teacher
    Given My role is teacher
    When I visit reservas page
    Then I should see a row in reservas table for each reserva made on google calendar API
    
  
  Scenario: Show bookings made on Google Calendar API in a table to a secretary
    Given My role is secretary
    When I visit reservas page
    Then I should see a row in reservas table for each reserva made on google calendar API
    
  
  Scenario: Show bookings made on Google Calendar API in a table to an administrator
    Given My role is admin
    When I visit reservas page
    Then I should see a row in reservas table for each reserva made on google calendar API