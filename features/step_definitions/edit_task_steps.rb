Given("I click on the Edit button of the existing task") do
  find('a[id="Task teste_id"]').click
end

Given("alter the name to {string}") do |name|
  @new_edittask_name = name
  fill_in "task_name", :with => name
end

When("I click on the Update button") do
  click_button "Create"
end

Then("I should see the task card updated") do
  findString = 'em[name="' + @new_edittask_name + '"]'
  find(findString).click
end
