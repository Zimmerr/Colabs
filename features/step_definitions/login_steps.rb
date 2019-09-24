Given (/^I am on the homepage$/) do
  visit "landing"
end

When (/^I fill the login form with (.*) as email and (.*) as password$/) do |email, password|
  fill_in "Email", :with => email
  fill_in "Senha", :with => password
end

When (/^I click the Login button$/) do
  click_button "Login"
end

Then (/^I should see the initial user page$/) do
  expect(page).to have_xpath('.//button[@id="dropdownMenuButton"]')
end
