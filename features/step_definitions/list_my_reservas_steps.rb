Given(/^I am logged in$/) do
  visit '/users/sign_in'
  fill_in 'user_email', :with => 'teste@test.com'
  fill_in 'user_password', :with => '123456'
  click_button 'Entrar'
end

When(/^I check in (.+)$/) do |minhas_reservas|
  check minhas_reservas
end

When(/^I click on (.+)$/) do |button|
  click_button button
end

Then(/^I should only see reservas designated to me$/) do
  expect(page.all('tr').count).to be == page.all('td', :text => 'teste').count
end

Then(/^I should not see Filtrar button$/) do
  expect(page).to_not have_button("minhas_reservas_submit")
end

Then(/^I should see Filtrar button/) do
  expect(page).to have_button("minhas_reservas_submit")
end
