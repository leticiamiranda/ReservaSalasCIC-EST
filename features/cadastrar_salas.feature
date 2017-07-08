Feature: Add sala
	As admin
	In order to manage salas registered
	I Want add sala that exists on CIC/EST

	Background: User is logged in
    	Given I am registered as a user

    Scenario: Add Sala, but have no permission
		Given My role is teacher
		And I am logged in
		When I am on the salas page
		And I press "Criar nova"
		Then I see a alert message of access denied

	Scenario: Add Sala, with permission
		Given My role is admin
		And I am logged in
		When I am on the salas page
		And I press "Criar nova"
		Then I will be on cadastrar sala page
		When fill the form
		Then I Should see my register in the list

	Scenario: Add Sala, like secretary
		Given My role is secretary
		And I am logged in
		When I am on the salas page
		And I press "Criar nova"
		Then I am on the cadastrar sala page
		When fill the form 
		Then I Should see my register in the list

	Scenario: Add Sala, but exists other sala with same name
		Given My role is secretary
		And I am logged in
		When I am on the salas page
		And I press "Criar nova"
		Then I am on the cadastrar sala page
		When fill the form
		Then I am on the salas page
		And I press "Criar nova"
		And fill the form again with sala with same name 
		Then I see a alert message


