Feature: Add sala
	As admin
	In order to manage salas registered
	I Want add sala that exists on CIC/EST

	Background: User is logged in
    	Given I am registered as a user

	Scenario: Add Sala
		Given My role is admin
		When I am on the salas page
		And I follow "Cadastrar sala"
		Then I am on the cadastrar sala page
		When fill the form
		Then I Should see my register in the list