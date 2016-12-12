When(/^click in "([^"]*)"$/) do |link|
	click_link (link)
end

Then(/^I will be on cadastrar sala page$/) do 
	expect(current_path).to eq('salas/new')
end

When(/^fill the form$/) do
	fill_in 'Nome', :with => "LARA"
	fill_in 'Qtd lugares', :with => "20"
	fill_in 'Disponivel', :with => "True"
	click_button "Cadastrar sala"

end

Then(/^I Should see my register in the list$/) do
	have_content ('LARA')
end
