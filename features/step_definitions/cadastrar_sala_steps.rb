When(/^click in "([^"]*)"$/) do |link|
	click_link (link)
end

Then(/^I will be on cadastrar sala page$/) do 
	expect(@user.name).to eq('teste')
	expect(@user.admin!)
	expect(current_path) == 'salas/new'
end

When(/^fill the form$/) do
	expect(page).to have_content "Nome"
	fill_in 'nome', :with => "LARA"
	fill_in 'Qtd lugares', :with => "20"
	fill_in 'Disponivel', :with => "True"
	click_button "Cadastrar sala"

end

Then(/^I Should see my register in the list$/) do
	have_content ('LARA')
end

Then (/^I should see a info message$/) do
  page.should have_selector ".info", text: "Preecha este campo."
end
