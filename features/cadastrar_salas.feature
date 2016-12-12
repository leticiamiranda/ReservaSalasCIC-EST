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
		Then I will be on cadastrar sala page
		When fill the form
		Then I Should see my register in the list

	Scenario: Try to add sala, but do not fill all fields	
		Given I am on the cadastrar sala page
		When I fill in "Qtd lugares" with "10" 
		And I fill in "Disponivel" with "True"
		Then I should see a info message