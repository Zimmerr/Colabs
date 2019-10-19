Given (/^I am on the first page$/) do
  visit '/'
end

When (/^I fill the search project form with (.*) as search_term $/) do |search_term|
  @project_count = Project.search(1, search_term).count
  fill_in "search_term", :with => search_term
end

When (/^click on 'Buscar' button$/) do
  click_button "Buscar"
end

Then (/^at least one project should be finded$/) do
    @project_count >= 1
end

Then (/^I should be able to see it$/) do
  expect(page).to have_xpath('.//div[@class="card-header"]')
end

