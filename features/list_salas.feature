Feature: display list of salas

Background: User is logged in
    Given I am registered as a user

Given the following salas exist:
 | nome                    | qtd_lugares | disponivel |
 | sala 1                  | 20          | true       |
 | sala 2                  | 10          | true       |
 | sala 3                  | 10          | false      |
 | sala 4                  | 15          | true       |
 | sala 5                  | 5           | false      |
 
	Scenario: list all salas for to a teacher
		Given My role is teacher
		When I am on the salas page	
   		Then I should see all the salas 

   	Scenario: list all salas to a secretary
		Given My role is secretary
		When I am on the salas page	
   		Then I should see all the salas 

   	Scenario: list all salas to a admin
		Given My role is admin
		When I am on the salas page	
   		Then I should see all the salas 	