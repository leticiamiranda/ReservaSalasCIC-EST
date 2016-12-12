Feature: display list of recursos

Background: User is logged in
    Given I am registered as a user


	Scenario: list all recursos for to a teacher
		Given My role is teacher
		And I am on the recursos page
   		Then I should see all the recursos 

   	Scenario: list all recursos to a secretary
		Given My role is secretary
		When I am on the recursos page	
   		Then I should see all the recursos 

   	Scenario: list all recursos to a admin
		Given My role is admin
		When I am on the recursos page	
   		Then I should see all the recursos 	