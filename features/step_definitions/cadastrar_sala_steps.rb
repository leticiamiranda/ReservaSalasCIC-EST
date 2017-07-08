When(/^click in "([^"]*)"$/) do |link|
	click_link (link)
end

Then (/^I will be on cadastrar sala page$/) do 
	expect(current_path).to eq('/salas/new')
end

When(/^fill the form$/) do
	expect(page).to have_content "Nome"
	fill_in 'sala_nome', :with => "LARA"
	fill_in 'sala_qtd_lugares', :with => "20"
	
	click_button "Criar Sala"
end

When(/^fill the form again with sala with same name$/) do
	fill_in 'sala_nome', :with => "LARA"
	fill_in 'sala_qtd_lugares', :with => "20"
	click_button "Criar Sala"
end

Then(/^I Should see my register in the list$/) do
	have_content ('LARA')
end

Then (/^I should see a info message$/) do
  expect(page).to have_content "Preencha este campo."
end

Then (/^I see a alert message of access denied$/) do
	expect(page).to have_selector ".alert", text: "Você não tem permissão para acessar essa página."
end

Then (/^I see a alert message$/) do
	expect(page).to have_selector ".alert", text: "Sala não cadastrada."
end

