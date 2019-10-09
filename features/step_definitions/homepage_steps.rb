When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the login container$/) do
  expect(page).to have_content("Login")
end

Then(/^I should see my project named "(.*)"$/) do |nome|
  expect(page).to have_content("#{nome}")
end

Then(/^I should see that there is no projects to be shown$/) do
  expect(page).to have_content("Você ainda não tem projetos cadastrados!")
end