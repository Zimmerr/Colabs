When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the login container$/) do
  expect(page).to have_content("Login")
end
