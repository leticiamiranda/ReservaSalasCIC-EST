Feature: Salas
	In order to manage the salas
	As Admnistrator
	I Want send and manage all salas

	Scenario: Add Salas
		When I am in the page
		And click in "Cadastrar sala"
		And fill the form
		Then I Should see my register in the list