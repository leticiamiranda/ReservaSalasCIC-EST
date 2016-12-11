Feature: Salas
	In order to manage the salas
	As Admnistrator
	I Want send and manage all salas

	Scenario: Add Salas
		Given I am on the salas page
		When I follow "Cadastrar sala"
		Then I will be on cadastrar sala page
		When I fill in "Nome" with "Sala"
		Then I Should see my register in the list