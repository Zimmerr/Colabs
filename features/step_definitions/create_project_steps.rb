Given (/^I am on the main page$/) do
  visit '/'
end

When (/^click on the 'clicando aqui!' link$/) do
  click_link "clicando aqui!"
end

When (/^click on the 'Novo projeto' button$/) do
  click_on "Novo projeto"
end

When (/^I fill the create project form with (.*) as name and (.*) as desc$/) do |name, description|
  @actual_count = Project.count
  fill_in "project_name", :with => name
  fill_in "project_desc", :with => description
end

When (/^click on the 'Create Project' button$/) do
  click_button "Create Project"
end

Then (/^I should have at least one project$/) do
    Project.count.should >= 1
end

Then (/^I should see my projects page$/) do
  expect(page).to have_xpath('.//div[@id="meus_projetos"]')
end

