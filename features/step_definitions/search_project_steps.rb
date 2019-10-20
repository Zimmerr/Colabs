Given (/^I am on first page$/) do
  visit '/'
end

When (/^I fill the search project form with (.*) as search_term$/) do |search_term|
  fill_in "search_term", :with => search_term
end

When (/^click on the 'Buscar' button$/) do
  click_button "Buscar"
end

Then (/^I should be able to see it$/) do
  expect(page).to have_xpath('.//div[@class="card-header"]')
end

