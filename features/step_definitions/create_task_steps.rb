Given("I clicked on the task button of my project") do
  visit 'meus_projetos'
  find("#task_button").click
end

Given("got redirected to the task board page") do
  expect(page).to have_xpath('.//a[@id="list_button"]')
end

Given("click on the button related to the list page") do
  @current_page = URI.parse(current_url)
  find("#list_button").click
end

When("I go back to the task board page") do
  visit(@current_page)
end

When("click on the Add a card button on the {string} list") do |string|
  find('#Fazendo_id').click
end

When("fill the task form creating the new one") do
  @actual_task_count = Task.count
  fill_in "task_name", :with => 'Task teste'
  fill_in "task_desc", :with => 'Descrição da tarefa criada como teste'
  select 'Fazendo', from: "task_list_id"
  click_button "Create"
end

Then("the number of tasks of the list should be increased by one") do
  Task.count.should == @actual_task_count + 1
end

Then("I should see the task on the appropriate list") do
  expect(page).to have_xpath('.//a[@id="Task teste_id"]')
end
