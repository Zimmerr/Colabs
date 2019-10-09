Given (/^I am on the Edit Project page$/) do
  visit 'projects/1/edit'
end

When (/^I fill the edit project form with (.*) as name and (.*) as desc and (.*) as id$/) do |name, description, id|
  @actual_count = Project.count
  fill_in "project_name", :with => name
  fill_in "project_desc", :with => description
  #fill_in "project_id", :with => id
end

When (/^click on 'Atualizar' button$/) do
  click_button "Atualizar"
end

Then (/^the number of existent projects shoulbe be the same$/) do
    Project.count.should == @actual_count
end

Then (/^I should be sent back to the meus_projetos$/) do
  expect(page).to have_xpath('.//div[@id="meus_projetos"]')
end
